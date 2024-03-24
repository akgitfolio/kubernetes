const http = require("http");
const https = require("https");
const fs = require("fs");

const server = http.createServer(async (req, res) => {
  if (req.url === "/") {
    const clusterInfo = {
      cluster_name: process.env.CLUSTER_NAME || "Unknown",
      api_server: process.env.KUBERNETES_SERVICE_HOST || "Unknown",
      nodes: await getNodesInfo(),
    };
    res.writeHead(200, { "Content-Type": "application/json" });
    res.end(JSON.stringify(clusterInfo));
  } else {
    res.writeHead(404, { "Content-Type": "text/plain" });
    res.end("Not Found");
  }
});

async function getNodesInfo() {
  try {
    const token = fs.readFileSync(
      "/var/run/secrets/kubernetes.io/serviceaccount/token",
      "utf-8"
    );
    const options = {
      hostname: process.env.KUBERNETES_SERVICE_HOST,
      path: "/api/v1/nodes",
      method: "GET",
      headers: {
        Authorization: `Bearer ${token}`,
        Accept: "application/json",
      },
    };

    return new Promise((resolve, reject) => {
      const req = https.request(options, (res) => {
        let data = "";
        res.on("data", (chunk) => {
          data += chunk;
        });
        res.on("end", () => {
          resolve(
            JSON.parse(data).items.map((node) => ({
              name: node.metadata.name,
              status: node.status.phase,
            }))
          );
        });
      });

      req.on("error", (error) => {
        console.error("Error fetching nodes information:", error);
        reject(error);
      });

      req.end();
    });
  } catch (error) {
    console.error("Error fetching nodes information:", error);
    return [];
  }
}

const PORT = process.env.PORT || 5050;
server.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});

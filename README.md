# OpenFaaS Fast Install

This project provides a streamlined installation of OpenFaaS using Docker containers. It includes all necessary components for running OpenFaaS in a containerized environment with minimal setup.

## Prerequisites

- Docker
- Docker Compose
- Git
- Bash shell (Git Bash for Windows users)

## Quick Start

1. Clone this repository:
```bash
git clone https://github.com/yourusername/openfaas-fast-install.git
cd openfaas-fast-install
```

2. Start OpenFaaS (Windows):
```powershell
docker-compose up -d
```

   Or on Linux/Mac:
```bash
chmod +x install-openfaas.sh
./install-openfaas.sh
```

3. Wait for about 30 seconds for all services to start
4. Your OpenFaaS installation is ready!

## Components

The deployment includes:
- OpenFaaS Gateway
- Prometheus (metrics)
- AlertManager
- NATS (message queue)

## Configuration

Default credentials:
- Username: admin
- Password: admin

You can change these by setting environment variables:
```bash
export ADMIN_USER=your_username
export ADMIN_PASSWORD=your_password
./install-openfaas.sh
```

## Accessing OpenFaaS

Once installed, access:
- OpenFaaS Portal: http://localhost:8081
- Prometheus: http://localhost:9090
- AlertManager: http://localhost:9093

## Testing the Hello Python Function

The repository includes a sample Python function that you can test immediately:

1. Build the function:
```bash
cd hello-python
docker build -t hello-python .
```

2. Run the function:
```bash
docker run -d -p 8080:8080 hello-python
```

3. Test the function:

Windows (PowerShell):
```powershell
Invoke-WebRequest -Method Post -Body "Hello World" -Uri http://localhost:8080
```

Linux/Mac:
```bash
curl -X POST -d "Hello World" http://localhost:8080
```

Expected response:
```
Hello from OpenFaaS! You sent: Hello World
```

You can modify the function by editing `hello-python/handler.py` and rebuilding the container.

## Using faas-cli

After installation:
```bash
export OPENFAAS_URL=http://127.0.0.1:8081
echo $ADMIN_PASSWORD | faas-cli login --password-stdin
```

## Troubleshooting

1. If services don't start:
   ```bash
   docker-compose ps
   docker-compose logs
   ```

2. To restart services:
   ```bash
   docker-compose down
   docker-compose up -d
   ```

## Security Notes

- Change default credentials before deploying to production
- Consider using HTTPS in production environments
- Regularly update components using `docker-compose pull`

## License

This project is licensed under the MIT License - see the LICENSE file for details.
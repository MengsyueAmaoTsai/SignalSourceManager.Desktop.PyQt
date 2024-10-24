import httpx


class ResourceService:
    BASE_ADDRESS = "https://localhost:10000"

    def __init__(self) -> None:
        pass

    async def create_signal_source(self, id: str, name: str, description: str, visibility: str) -> None:
        async with httpx.AsyncClient(verify=False) as http_client:
            body = {
                "id": id,
                "name": name,
                "description": description,
                "visibility": visibility,
            }

            response = await http_client.post(f"{self.BASE_ADDRESS}/api/v1/signal-sources", json=body)

            print(response)

    async def delete_signal_source(self, signal_source_id: str) -> None:
        async with httpx.AsyncClient(verify=False) as http_client:
            response = await http_client.delete(f"{self.BASE_ADDRESS}/api/v1/signal-sources/{signal_source_id}")
            print(response)

    async def get_signal_source(self, signal_source_id: str) -> None:
        async with httpx.AsyncClient(verify=False) as http_client:
            response = await http_client.get(f"{self.BASE_ADDRESS}/api/v1/signal-sources/{signal_source_id}")
            print(response)

    async def list_signal_sources(self) -> None:
        async with httpx.AsyncClient(verify=False) as http_client:
            response = await http_client.get(f"{self.BASE_ADDRESS}/api/v1/signal-sources")
            print(response)

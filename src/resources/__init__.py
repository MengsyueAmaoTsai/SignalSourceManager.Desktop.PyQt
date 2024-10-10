import httpx

from .contracts import ApiRoutes, ErrorResponse, SignalSourceDetailsResponse, SignalSourceResponse
from .ResourceOptions import ResourceOptions


class ResourceService:
    def __init__(self, base_address: str) -> None:
        self._base_address = base_address

    async def list_signal_sources(self) -> list[SignalSourceResponse] | ErrorResponse:
        async with httpx.AsyncClient(verify=False) as http_client:
            try:
                response = await http_client.get(f"{self._base_address}{ApiRoutes.SignalSources.List}")

                if response.status_code >= 400:
                    print(f"Error: {response.status_code}")
                    return ErrorResponse.model_validate_json(response.json())

                return [SignalSourceResponse(**data) for data in response.json()]

            except Exception as e:
                print(f"Error loading data: {e}")
                return ErrorResponse(
                    type="error",
                    title="Error loading data",
                    detail=str(e),
                    status=500,
                )

    async def get_signal_source(self, id: str) -> SignalSourceDetailsResponse | ErrorResponse:
        async with httpx.AsyncClient(verify=False) as http_client:
            try:
                response = await http_client.get(f"{self._base_address}{ApiRoutes.SignalSources.Get.format(id=id)}")

                if response.status_code >= 400:
                    print(f"Error: {response.status_code}")
                    return ErrorResponse.model_validate_json(response.json())

                return SignalSourceDetailsResponse(**response.json())

            except Exception as e:
                print(f"Error loading data: {e}")
                return ErrorResponse(
                    type="error",
                    title="Error loading data",
                    detail=str(e),
                    status=500,
                )


__all__ = [
    "ResourceService",
    "ResourceOptions",
    "ApiRoutes",
    "ErrorResponse",
    "SignalSourceDetailsResponse",
    "SignalSourceResponse",
]

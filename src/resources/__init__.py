from typing import cast

import httpx

from .contracts import (
    ApiRoutes,
    ErrorResponse,
    SignalSourceCreatedResponse,
    SignalSourceDetailsResponse,
    SignalSourceResponse,
)
from .ResourceOptions import ResourceOptions


class ResourceService:
    def __init__(self, base_address: str) -> None:
        self._base_address = base_address

    async def list_signal_sources(self) -> list[SignalSourceResponse] | ErrorResponse:
        async with httpx.AsyncClient(verify=False) as http_client:
            try:
                response = await http_client.get(self._combine_url(ApiRoutes.SignalSources.List))
                result = self.handle_response(SignalSourceResponse, response, list)
                return cast(list[SignalSourceResponse], result)

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
                response = await http_client.get(
                    self._combine_url(ApiRoutes.SignalSources.Get.format(signal_source_id=id))
                )

                result = self.handle_response(SignalSourceDetailsResponse, response)

                return cast(SignalSourceDetailsResponse, result)

            except Exception as e:
                print(f"Error loading data: {e}")
                return ErrorResponse(
                    type="error",
                    title="Error loading data",
                    detail=str(e),
                    status=500,
                )

    async def create_signal_source(
        self, id: str, name: str, description: str, visibility: str
    ) -> SignalSourceCreatedResponse | ErrorResponse:
        async with httpx.AsyncClient(verify=False) as http_client:
            try:
                response = await http_client.post(
                    self._combine_url(ApiRoutes.SignalSources.Create),
                    json={
                        "id": id,
                        "name": name,
                        "description": description,
                        "visibility": visibility,
                    },
                )

                result = self.handle_response(SignalSourceCreatedResponse, response)

                return cast(SignalSourceCreatedResponse, result)

            except Exception as e:
                print(f"Error loading data: {e}")
                return ErrorResponse(
                    type="error",
                    title="Error loading data",
                    detail=str(e),
                    status=500,
                )

    def handle_response[TResponse](
        self,
        response_type: type[TResponse],
        response: httpx.Response,
        container_type: type = dict,
    ) -> TResponse | list[TResponse] | ErrorResponse:
        if response.status_code >= 400:
            print(f"Error: {response.status_code}")
            return ErrorResponse.model_validate_json(response.json())

        if container_type is list:
            return [response_type(**data) for data in response.json()]
        return response_type(**response.json())

    def _combine_url(self, route: str) -> str:
        return f"{self._base_address}{route}"


__all__ = [
    "ResourceService",
    "ResourceOptions",
    "ApiRoutes",
    "ErrorResponse",
    "SignalSourceDetailsResponse",
    "SignalSourceResponse",
]

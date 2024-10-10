from datetime import datetime

import httpx
from pydantic import BaseModel, Field


class ApiRoutes:
    class SignalSources:
        List = "/api/v1/signal-sources"
        Get = "/api/v1/signal-sources/{id}"


class ErrorResponse(BaseModel):
    type: str
    title: str
    detail: str
    status: int


class SignalSourceResponse(BaseModel):
    id: str
    name: str
    description: str
    visibility: str
    status: str
    created_time_utc: datetime = Field(alias="createdTimeUtc")

    class Config:
        frozen = True


class SignalSourceDetailsResponse(SignalSourceResponse): ...


class ResourceService:
    BASE_ADDRESS = "https://localhost:10000"

    def __init__(self) -> None: ...

    async def list_signal_sources(self) -> list[SignalSourceResponse] | ErrorResponse:
        async with httpx.AsyncClient(verify=False) as http_client:
            try:
                response = await http_client.get(f"{self.BASE_ADDRESS}{ApiRoutes.SignalSources.List}")

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
                response = await http_client.get(f"{self.BASE_ADDRESS}{ApiRoutes.SignalSources.Get.format(id=id)}")

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

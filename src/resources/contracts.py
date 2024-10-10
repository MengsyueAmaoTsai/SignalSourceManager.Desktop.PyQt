from datetime import datetime

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

from pydantic import BaseModel, Field


class ResourceOptions(BaseModel):
    base_address: str = Field(alias="BaseAddress")

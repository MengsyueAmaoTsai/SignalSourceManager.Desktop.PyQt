from typing import ClassVar

from pydantic import BaseModel, Field


class ResourceOptions(BaseModel):
    SECTION_KEY: ClassVar[str] = "Resources"

    base_address: str = Field(alias="BaseAddress")

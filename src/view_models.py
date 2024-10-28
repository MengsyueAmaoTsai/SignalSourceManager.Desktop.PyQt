import asyncio

import httpx
from PySide6.QtCore import Property, QObject, Signal, Slot
from PySide6.QtWebSockets import QWebSocket


class MainViewModel(QObject):
    def __init__(self) -> None:
        super().__init__()

        self._websocket_client = QWebSocket()

    @Slot()
    def on_application_started(self) -> None:
        print("Application started")
        asyncio.run(self._connect_to_websocket())

    async def _connect_to_websocket(self) -> None:
        ## Get negotiation response from server
        connection_id = await self.__get_connection_id()

        if connection_id is None:
            raise Exception("Failed to get connection id")

        await self.__connect_to_hub(connection_id)

    async def __get_connection_id(self) -> str | None:
        async with httpx.AsyncClient(verify=False) as client:
            try:
                response = await client.post("https://localhost:10000/signals/negotiate?negotiateVersion=0")
                return response.json()["connectionId"]
            except Exception as e:
                print(e)
                return None

    async def __connect_to_hub(self, connection_id: str) -> None:
        url = f"wss://localhost:10000/signals?id={connection_id}"

        self._websocket_client.textMessageReceived.connect(self.__on_message_received)
        self._websocket_client.open(url)

    def __on_message_received(self, message):
        print("Received: ", message)

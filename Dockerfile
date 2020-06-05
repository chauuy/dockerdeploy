FROM mcr.microsoft.com/dotnet/core/samples:aspnetapp
#RUN apk add wget
COPY wget_1.20.1-1.1_amd64.deb /tmp/wget_1.20.1-1.1_amd64.deb
COPY libpcre2-8-0_10.32-5_amd64.deb /tmp/libpcre2-8-0_10.32-5_amd64.deb
RUN apt install /tmp/libpcre2-8-0_10.32-5_amd64.deb
RUN apt install /tmp/wget_1.20.1-1.1_amd64.deb

# Install .NET Core SDK v3.1.104 
RUN wget -O dotnet-sdk.tar.gz https://download.visualstudio.microsoft.com/download/pr/6fc7ce85-b14f-4718-9a9e-cdcf3c74f1ed/312edf594fe97da6ccdede646e18d479/dotnet-sdk-3.1.104-linux-musl-x64.tar.gz \
&& dotnetSDK_sha512='d4d39a46405d442d90e43c75c28ca2b4464a487dca5f48aa94e02872820af3e50b28ee3fe836dc6d2a7f2063730e08716dfc6281d78f04720144c99ab4c4ccd1' \
&& echo "$dotnetSDK_sha512  dotnet-sdk.tar.gz" | sha512sum -c - \
&& tar -zxf dotnet-sdk.tar.gz -C /usr/share/dotnet \
&& export DOTNET_ROOT=/usr/share/dotnet \
&& export PATH=$PATH:/usr/share/dotnet \
&& rm dotnet-sdk.tar.gz 


#RUN mkdir /webapp
#RUN mkdir /webapp/Properties

#COPY hello-world.csproj /webapp/hello-world.csproj
#COPY appsettings.json /webapp/appsettings.json
#COPY Program.cs /webapp/Program.cs
#COPY launchSettings.json /webapp/Properties/launchSettings.json

#RUN dotnet build /webapp/hello-world.csproj -c Release -o /webapp/bin

RUN ls -l /webapp/
#RUN dotnet publish /webapp/hello-world.csproj -c Release -o /webapp/publish
#RUN ls -l /webapp/publish

#WORKDIR /webapp/bin
#ENV replace appsettings.json
ENV ASPNETCORE_URLS=http://+:8080
EXPOSE 8080

#ENTRYPOINT ["dotnet", "hello-world.dll"]
#RUN dotnet run /webapp/hello-world.dll &

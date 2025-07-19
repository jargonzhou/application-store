# https://github.com/hhyo/archery/wiki/manual
# https://learn.microsoft.com/en-us/sql/connect/odbc/linux-mac/installing-the-microsoft-odbc-driver-for-sql-server
if ! [[ "11 12" == *"$(grep VERSION_ID /etc/os-release | cut -d '"' -f 2 | cut -d '.' -f 1)"* ]];
then
    echo "Debian $(grep VERSION_ID /etc/os-release | cut -d '"' -f 2 | cut -d '.' -f 1) is not currently supported.";
    exit;
fi

# DEPLOY_ENV: curl
# apt install -y curl

# Download the package to configure the Microsoft repo
curl -sSL -O https://packages.microsoft.com/config/debian/$(grep VERSION_ID /etc/os-release | cut -d '"' -f 2 | cut -d '.' -f 1)/packages-microsoft-prod.deb
# Install the package
dpkg -i packages-microsoft-prod.deb
# Delete the file
rm packages-microsoft-prod.deb

apt-get update
ACCEPT_EULA=Y apt-get install -y msodbcsql18
# optional: for bcp and sqlcmd
ACCEPT_EULA=Y apt-get install -y mssql-tools18
echo 'export PATH="$PATH:/opt/mssql-tools18/bin"' >> ~/.bashrc
source ~/.bashrc
# optional: for unixODBC development headers
# apt-get install -y unixodbc-dev
# optional: kerberos library for debian-slim distributions
# apt-get install -y libgssapi-krb5-2

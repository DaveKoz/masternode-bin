sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y
sudo apt-get install nano htop git -y
sudo apt-get install build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils software-properties-common libgmp3-dev  -y
sudo apt-get install libboost-all-dev -y
sudo add-apt-repository ppa:bitcoin/bitcoin -y
sudo apt-get install libzmq3-dev -y
sudo apt-get install libminiupnpc-dev -y
sudo apt-get update -y
sudo apt-get install libdb4.8-dev libdb4.8++-dev -y

sudo apt install git -y

mkdir $HOME/tempTPF
chmod -R 777 $HOME/tempTPF
sudo git clone https://github.com/tpfcoins/masternode-bin.git $HOME/tempTPF
cd $HOME/tempTPF

cd $HOME
mkdir $HOME/TPFcoin
mkdir $HOME/.tpfcoin
cp $HOME/tempTPF/Ubuntu/tpfcoin-cli $HOME/TPFcoin
cp $HOME/tempTPF/Ubuntu/tpfcoind $HOME/TPFcoin
cp $HOME/tempTPF/Ubuntu/tpfcoin-qt $HOME/TPFcoin
cp $HOME/tempTPF/Ubuntu/tpfcoin-tx $HOME/TPFcoin

ln -s $HOME/TPFcoin/tpfcoin-cli /usr/local/bin/tpfcoin-cli
ln -s $HOME/TPFcoin/tpfcoind /usr/local/bin/tpfcoind
ln -s $HOME/TPFcoin/tpfcoin-qt /usr/local/bin/tpfcoin-qt
ln -s $HOME/TPFcoin/tpfcoin-tx /usr/local/bin/tpfcoin-tx

chmod -R 777 $HOME/TPFcoin
chmod -R 777 $HOME/.tpfcoin
sudo apt-get install -y pwgen
EXIP=`wget -qO- ipinfo.io/ip`
PASS=`pwgen -1 20 -n`
printf "\n#--- new nodes ---\naddnode= 149.28.233.64\naddnode= 45.77.169.24\n" >> /$HOME/.tpfcoin/tpfcoin.conf

printf "rpcuser=user\nrpcpassword=$PASS\nrpcport=53535\nport=53534\ndaemon=1\nlisten=1\nserver=1\ntxindex=1\nmaxconnections=256\nrpcallowip=127.0.0.1\n" > /$HOME/.tpfcoin/tpfcoin.conf

#tpfcoind -daemon

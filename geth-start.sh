#!/bin/bash
node_mode=0
while [ -z "$node_mode" ] || [ $node_mode -lt 1 ] || [ $node_mode -gt 3 ]
do
  if [ $node_mode -ne 0 ]
  then
    echo "无效的选项，请重新输入"
  fi
  if [ $node_mode -eq 3 ]
  then
      echo "已退出"
    exit 0
  else
  read -p "请选择UABBC节点模式：1、普通挖矿模式 2、开发者模式（自动挖矿）3:退出：" node_mode
  fi
done

sync_mode=0
while [ -z "$sync_mode" ] || [ $sync_mode -lt 1 ] || [ $sync_mode -gt 4 ]
do
  if [ $sync_mode -ne 0 ]
  then
    echo "无效的选项，请重新输入"
  fi
  read -p "请选择需要启动的模式，1、fast 2、full 3、light 4、退出：" sync_mode
  case $sync_mode in
    1)
      echo "已选择fast模式"
      if [ $node_mode -eq 1 ]
      then
        command="geth --datadir ./geth-home/data --networkid 30888 --http --http.vhosts='*' --http.addr '0.0.0.0' --http.port 30888 --http.api 'admin,debug,eth,web3,personal,ethash,miner' --http.corsdomain '*' --ws --ws.addr '0.0.0.0' --ws.port 30999 --ws.api 'admin,debug,eth,web3,personal,ethash,miner' --ws.origins '*' --allow-insecure-unlock --syncmode=fast console 2> /dev/null"
      else
        command="geth --dev --datadir ./geth-home/data --networkid 30888 --http --http.vhosts='*' --http.addr '0.0.0.0' --http.port 30888 --http.api 'admin,debug,eth,web3,personal,ethash,miner' --http.corsdomain '*' --ws --ws.addr '0.0.0.0' --ws.port 30999 --ws.api 'admin,debug,eth,web3,personal,ethash,miner' --ws.origins '*' --allow-insecure-unlock --syncmode=fast console 2> /dev/null"
      fi
      ;;
    2)
      echo "已选择full模式"
      if [ $node_mode -eq 1 ]
      then
        command="geth --datadir ./geth-home/data --networkid 30888 --syncmode=full --http --http.vhosts='*' --http.addr '0.0.0.0' --http.port 30888 --http.api 'admin,debug,eth,web3,personal,ethash,miner' --http.corsdomain '*' --ws --ws.addr '0.0.0.0' --ws.port 30999 --ws.api 'admin,debug,eth,web3,personal,ethash,miner' --ws.origins '*' --allow-insecure-unlock console 2> /dev/null"
      else
        command="geth --dev --datadir ./geth-home/data --networkid 30888 --http --http.vhosts='*'--http.addr '0.0.0.0' --http.port 30888 --http.api 'admin,debug,eth,web3,personal,ethash,miner' --http.corsdomain '*' --ws --ws.addr '0.0.0.0' --ws.port 30999 --ws.api 'admin,debug,eth,web3,personal,ethash,miner' --ws.origins '*' --allow-insecure-unlock console 2> /dev/null"
      fi
      ;;
    3)
      echo "已选择light模式"
      if [ $node_mode -eq 1 ]
      then
        command="geth --datadir ./geth-home/data --networkid 30888 --syncmode=light --http --http.vhosts='*' --http.addr '0.0.0.0' --http.port 30888 --http.api 'admin,debug,eth,web3,personal,ethash,miner' --http.corsdomain '*' --ws --ws.addr '0.0.0.0' --ws.port 30999 --ws.api 'admin,debug,eth,web3,personal,ethash,miner' --ws.origins '*' --allow-insecure-unlock console 2> /dev/null"
      else
        command="geth --dev --datadir ./geth-home/data --networkid 30888 --http --http.vhosts='*' --http.addr '0.0.0.0' --http.port 30888 --http.api 'admin,debug,eth,web3,personal,ethash,miner' --http.corsdomain '*' --ws --ws.addr '0.0.0.0' --ws.port 30999 --ws.api 'admin,debug,eth,web3,personal,ethash,miner' --ws.origins '*' --allow-insecure-unlock console 2> /dev/null"
      fi
      ;;
    4)
      echo "已退出"
      exit 0
      ;;
    *)
      echo "无效的选项，请重新输入"
      ;;
  esac
done
echo "正在启动"
eval "$command"

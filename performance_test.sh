echo "CPU1"
echo -e "=======CPU threads=1======\n" >> test_result.txt
sysbench cpu --cpu-max-prime=20000 --threads=1 run >> test_result.txt

echo -e "\n=======CPU threads=4======\n" >> test_result.txt
echo "CPU4"
sysbench cpu --cpu-max-prime=20000 --threads=4 run >> test_result.txt

echo -e "\n=======MEM======\n" >> test_result.txt
echo "Mem"
sysbench memory --threads=4 --memory-total-size=10G --memory-oper=write --memory-scope=global run >> test_result.txt

echo -e "\n=======IO Prepare======\n" >> test_result.txt
echo "Prepare"
sysbench fileio --threads=16 --file-total-size=1G --file-test-mode=rndrw prepare >> test_result.txt

echo -e "\n=======IO Run======\n" >> test_result.txt
echo "io running"
sysbench fileio --threads=16 --file-total-size=1G --file-test-mode=rndrw run >> test_result.txt

echo -e "\n=======IO Cleaning up======\n" >> test_result.txt
echo "clean up"
sysbench fileio --threads=16 --file-total-size=1G --file-test-mode=rndrw cleanup >> test_result.txt

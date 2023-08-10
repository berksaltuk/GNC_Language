echo "Moving into the directory"
cd ./LexYacc

echo ""
echo "Cleaning the files"
echo ""

make clean

echo ""
echo "Building the Projects"
echo ""

make

echo ""
echo "Executing the tests"
echo ""

for test in ./test/*; do
    echo ""
    echo $test
    echo ""
    ./out/programme.exe < $test 
done

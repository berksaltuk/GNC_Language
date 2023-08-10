echo "Cleaning the files"
echo ""

cd LexYacc

make clean 

echo ""
echo "Building the project"
echo ""

make

echo ""
echo "Running the project"
./out/programme.exe

rm -rf objects
mkdir objects
cd objects 
ar -x ../libalgo.a
cd ..

ld -r -o algo.o --wrap=malloc --wrap=free objects/libalgo.c.o

ld -r -o algo_one.o algo.o objects/func_warp.c.o

ar -rv libalgo_one.a algo_one.o

rm *.o
rm -rf objects
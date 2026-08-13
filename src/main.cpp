#include "App.hpp"

int main(){
    try{
#ifdef __EMSCRIPTEN__
        aqua::App app(1280,800);
#else
        aqua::App app(1600,960);
#endif
        app.run();
    }catch(const std::exception& e){
        std::cerr<<"AquaVillage Cinematic fatal error:\n"<<e.what()<<"\n";
        return 1;
    }
    return 0;
}

#include <iostream>
#include <string>
#include <regex>

#include "TutorialConfig.h"


int main(int argc, char* argv[]) {
    std::basic_string<char> s(argv[0]);
    std::__cxx11::basic_string<char> s11(argv[0]);

    std::basic_regex ninth ("\\bd\\w+", 0);     

    std::string subject = "Duddy the duck";
    std::string replacement = "yup";

    std::cout << "Usage: " << s << s11 << regex_replace (subject, ninth, replacement) << std::endl;

    return 0;
}

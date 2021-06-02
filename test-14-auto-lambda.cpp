#include <iostream>

void use_lambda_auto() {
	auto f1 = [](auto x, auto y) { return x + y; };
	std::cout << "lambda auto (of int) " << f1(2, 3) << " ok" << std::endl;
	std::cout << "lambda auto (of float) " << f1(2.0, 3.0) << " ok" << std::endl;
}

int main() {
	use_lambda_auto();
	return 0;
}

#include <iostream>

constexpr int sum (int a, int b)
{
	if (a > 0) 
	       return 	b;
	else 
		return a;
}

void use_constexpr()
{
	constexpr int c = sum (5, 12); 	
	std::cout << "constexpr " << c << " ok" <<std::endl;
}

int main() {
	use_constexpr();
	return 0;
}

#include "stdafx.h"
namespace 
{
	bool IsValidArgumentsCount(int argumensCount, int expectedCount)
	{
		if (argumensCount != expectedCount)
		{
			std::cout << "Wrong arguments count\n"
				<< "Usage: appName.exe <fileName.db>"
				<< std::endl;
			return false;
		}

		return true;
	}
}

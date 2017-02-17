#include "stdafx.h"
#include "ValidationFunctions.h"
#include "CAuthorsFinder.h"
static int NUM_OF_ARGUMENTS = 2;

using namespace std;

int main(int argc, char *argv[]) try
{
	string filePath;
	if (IsValidArgumentsCount(argc, NUM_OF_ARGUMENTS))
	{
		filePath = argv[1];
	}
	else
	{
		cout << endl << "Input file path: ";
		getline(cin, filePath);
		cout << endl;
	}

	CAuthorsFinder finder(filePath);
	
	while (!cin.eof() && !cin.fail())
	{
		string authorName;
		cout << "Enter username: ";
		getline(cin, authorName);
		cout << "Record id: ";
		try
		{
			for (auto current : finder.GetIdS(authorName))
				cout << current << " ";
		}
		catch (const std::exception& ex)
		{
			cout << ex.what();
		}
		
		cout << endl;
		cin.clear();
	}

    return 0;
}
catch (const std::exception& ex)
{
	cout << ex.what() << endl;
}


// SearchInCSV.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include <iostream>
#include "CAuthorsFinder.h"

using namespace std;

int main(int argc, char *argv[])
{
	CAuthorsFinder finder("input/db.csv");
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


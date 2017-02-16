// SearchInCSV.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include <iostream>
#include "CAuthorsFinder.h"


using namespace std;

int main(int argc, char *argv[])
{
	CAuthorsFinder finder("input/db.csv");
	//while (!cin.eof() && !cin.fail())
	//{
	//	string authorName;
	//	cout << "Enter username: ";
	//	cin >> authorName;
	//	cout << "Record id: ";
	//	for (auto current : finder.GetAuthorRecordIdS(authorName))
	//		cout << current;
	//	cout << endl;
	//	cin.clear();
	//}

    return 0;
}


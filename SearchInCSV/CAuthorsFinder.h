#pragma once
#include <fstream>
#include <string>
#include <vector>
#include <map>
#include "CSV_Parser/csv.h"

struct Columns
{
	int id;
	int port;
	std::string file;
	std::string description;
	std::string date;
	std::string author;
	std::string platform;
	std::string type;
};

class CAuthorsFinder
{
public:
	CAuthorsFinder() = delete;
	CAuthorsFinder(std::string filePath)
		:m_CSVparser(filePath.c_str())
	{
		Columns cols;
		m_CSVparser.read_header(io::ignore_extra_column, 
			"id", "file", "description", "date", "author", "platform", "type", "port");
		while (m_CSVparser.read_row(cols.id, cols.file, cols.description, cols.date, 
			cols.author, cols.platform, cols.type, cols.port))
		{
			m_authors[cols.author].push_back(cols.id);
		}
	}

	std::vector<int> GetIdS(std::string authorName)
	{
		if(!m_authors.count(authorName))
		{
			throw std::out_of_range("DataBase has not this name");
		}
		return m_authors.at(authorName);
	}
private:
	std::map<std::string, std::vector<int>> m_authors;
	io::CSVReader<8, io::trim_chars<' '>, io::double_quote_escape<',', '\"'>> m_CSVparser;
};
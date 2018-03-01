mysql -u root --local-infile finance < setup_current.sql
python summarize.py

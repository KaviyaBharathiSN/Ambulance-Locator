cd('C:\Users\Kaviya\Desktop\dataset');
ds = dataset('XLSFile','book.csv');
time=ds(ds.Day_of_Week > 3 & ds.Day_of_Week < 5);

cd('C:\Users\Kaviya\Desktop\dataset');
x=input('Enter the value of time intial');
y= input('enter the value of time end');
ds = dataset('XLSFile','book.csv');
time=ds(ds.Time > x & ds.Time < y);

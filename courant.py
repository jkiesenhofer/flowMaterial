import matplotlib.pyplot as plt
a=[]
c=[]
t=[]
with open("log.foamRun", "r") as file:
    for line in file:
        if line.startswith("Interface Courant"):
           b=line.split(" ")
           #print(float(b[6]))
           a.append(float(b[4]))
           c.append(float(b[6]))
        if line.startswith("Time = "):
           b=line.split("s")
           d=float(b[0].split(" ")[2])
           #print(c)
           t.append(d)
a.pop()
c.pop()
plt.subplot(1, 2, 1)
plt.plot(t,a,"k--")

plt.xlabel("Time in s")
plt.ylabel("Interface Courant Number mean")

plt.subplot(1, 2, 2)
plt.plot(t,c,"k--")

plt.xlabel("Time in s")
plt.ylabel("Interface Courant Number mean")

plt.show()
print(t)

import numpy as np
import matplotlib.pyplot as plt
from matplotlib.animation import FuncAnimation

# ---------- Parameter ----------
dt = 0.1

bubble_radius = 0.5
particle_radius = 0.15

bubble_pos = np.array([0.0, 0.0])
particle_pos = np.array([-3.0, 0.2])

bubble_vel = np.array([0.0, 0.0])
particle_vel = np.array([1.5, 0.0])

bubble_mass = 5.0
particle_mass = 1.0

attached = False
attach_offset = None

# ---------- Kollision ----------
def elastic_collision(p1, v1, m1, p2, v2, m2):
    normal = p1 - p2
    normal = normal / np.linalg.norm(normal)

    v_rel = np.dot(v1 - v2, normal)

    if v_rel > 0:
        return v1, v2

    impulse = (2 * v_rel) / (1/m1 + 1/m2)
    v1_new = v1 - impulse * normal / m1
    v2_new = v2 + impulse * normal / m2

    return v1_new, v2_new

# ---------- Plot ----------
fig, ax = plt.subplots()
ax.set_xlim(-5, 5)
ax.set_ylim(-3, 3)
ax.set_aspect('equal')

bubble = plt.Circle(bubble_pos, bubble_radius, color='skyblue', alpha=0.6)
particle = plt.Circle(particle_pos, particle_radius, color='red')

ax.add_patch(bubble)
ax.add_patch(particle)

# ---------- Animation ----------
def update(frame):
    global bubble_pos, particle_pos, bubble_vel, particle_vel
    global attached, attach_offset

    bubble_pos += bubble_vel * dt

    if not attached:
        particle_pos += particle_vel * dt

        dist_vec = particle_pos - bubble_pos
        dist = np.linalg.norm(dist_vec)

        if dist <= bubble_radius + particle_radius:
            # --- Partikel haftet ---
            attached = True

            # Normierter Kontaktvektor
            normal = dist_vec / dist

            # Position exakt auf Oberfläche setzen
            particle_pos = bubble_pos + normal * (bubble_radius + particle_radius)

            # Relativer Offset speichern
            attach_offset = particle_pos - bubble_pos

            # gleiche Geschwindigkeit
            particle_vel[:] = bubble_vel[:]

    else:
        # --- Partikel bewegt sich mit Bubble ---
        particle_pos = bubble_pos + attach_offset

    bubble.center = bubble_pos
    particle.center = particle_pos

    return bubble, particle

ani = FuncAnimation(fig, update, frames=300, interval=30)
plt.show()


import numpy as np
import argparse
import csv
from scipy.spatial.transform import Rotation

def convert(T):
    trans = np.array([T[0,3], T[1,3], T[2,3]])
    r =  Rotation.from_matrix(T[:3,:3])
    euler = r.as_euler("xyz",degrees=True)
    return euler, trans

def main(args):
    original_calib = np.array(
          [[0.76975117, -0.18020627,  0.61237969,  0.06378889],
           [0.2801665 ,  0.95736355, -0.07043916, -0.00138532],
           [-0.57357646,  0.22578896,  0.78741951, -0.042494 ],
           [0.        ,  0.        ,  0.        ,  1.        ]]
    )

    euler_orig, trans_orig = convert(original_calib)

    T = np.identity(4)
    with open(args.file) as csv_file:
        csv_reader = csv.reader(csv_file, delimiter=',')
        i = 0
        for row in csv_reader:
            T[i,:] = row
            i += 1
        euler, trans = convert(T)

        print(f"Original => Rot: {euler_orig} | Trans: {trans_orig}")
        print(f"Optimized => Rot: {euler} | Trans: {trans}")

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--file",
                        type=str,
                        required=True,
                        help="solved extrinsics file path")
    args = parser.parse_args()
    main(args)
import xml.etree.ElementTree as ET
import matplotlib.pyplot as plt
import collections
import datetime
from flask import Flask, render_template
import threading

app = Flask(__name__)

def parse_robot_log(log_xml):
    root = ET.fromstring(log_xml)
    test_cases = root.findall('.//test')
    test_statuses = []
    test_durations = []

    for test_case in test_cases:
        # Menghitung jumlah status
        test_status = test_case.find('status').attrib['status']
        test_statuses.append(test_status)

        # Menghitung durasi tes
        start_time = test_case.find('status').attrib['starttime']
        end_time = test_case.find('status').attrib['endtime']
        duration = datetime.datetime.strptime(end_time, "%Y%m%d %H:%M:%S.%f") - datetime.datetime.strptime(start_time, "%Y%m%d %H:%M:%S.%f")
        test_durations.append(duration.total_seconds())

    # Grafik jumlah status data set 1
    status_counts = collections.Counter(test_statuses)
    status_labels = list(status_counts.keys())
    status_values = list(status_counts.values())

    # Data Set 2
    labels2 = status_labels[:len(status_labels)]  # Menggunakan label dari data set 1
    values2 = [1, 3]  # Contoh data set 2

    # Mengatur lebar batang
    bar_width = 0.35

    # Mengatur posisi x untuk setiap batang
    x1 = range(len(status_labels))
    x2 = [x + bar_width for x in x1]

    # Membuat diagram batang dengan dua set data
    fig1, ax1 = plt.subplots(figsize=(8, 6))
    fig2, ax2 = plt.subplots(figsize=(8, 6))
    fig3, ax3 = plt.subplots(figsize=(8, 6))
    
    # Grafik jumlah status
    ax1.bar(status_labels, status_values, color='#FEBE8C', edgecolor='black', linewidth=1.5)
    ax1.set_xlabel('Test Status')
    ax1.set_ylabel('Count')
    ax1.set_title('Test Status Report')
    ax1.grid(axis='y', linestyle='--')

    # Grafik comparison jumlah status
    rects1 = ax2.bar(x1, status_values, width=bar_width, label='Automatio Testing')
    rects2 = ax2.bar(x2, values2, width=bar_width, label='Manual Testing')
    ax2.set_xlabel('Test Status')
    ax2.set_ylabel('Count')
    ax2.set_title('Comparison of Test Status')
    ax2.set_xticks(x1)
    ax2.set_xticklabels(status_labels)
    ax2.legend()

    # Grafik test duration
    ax3.bar(range(len(test_durations)), test_durations, color='#B6E2A1', edgecolor='black', linewidth=1.5)
    ax3.set_xlabel('Test Case')
    ax3.set_ylabel('Duration (seconds)')
    ax3.set_title('Test Case Durations')

    # Menyimpan gambar diagram sebagai file PNG
    fig1.savefig('static/status_report.png', bbox_inches='tight')
    fig2.savefig('static/comparison.png', bbox_inches='tight')
    fig3.savefig('static/test_durations.png', bbox_inches='tight')

    # Menghapus plot agar tidak ditampilkan di aplikasi Flask
    plt.close(fig1)
    plt.close(fig2)
    plt.close(fig3)

@app.route('/')
def dashboard():
    with open('output.xml', 'r') as file:
        log_xml = file.read()
    parse_robot_log(log_xml)
    return render_template('dashboard.html')

def run_app():
    app.run()

if __name__ == '__main__':
    threading.Thread(target=run_app).start()

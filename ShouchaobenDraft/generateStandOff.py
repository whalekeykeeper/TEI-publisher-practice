import xml.etree.ElementTree as ET

if __name__ == "__main__":
    tree1 = ET.parse("mainDoc.xml")
    root1 = tree1.getroot()

    for child in root1.findall(".//placeName"):
        print(child)



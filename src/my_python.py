'''Contains the CountUpdater class'''

#Standard Imports
import os


class CountUpdater:
    '''Gets and sets the count in the count_file'''
    def __init__(self):
        self.count_file = 'my_count.txt'

    def get_count(self):
        '''Gets the count inside the count_file'''
        if os.path.exists(self.count_file):
            with open(file=self.count_file, mode='r') as fileOpen:
                result = fileOpen.readline()
                if result == '':
                    count = 0
                else:
                    count = int(result)
        else:
            count = 0
        print(f"Count is {count}")
        return count

    def set_count(self, count: str):
        with open(file=self.count_file, mode='w+') as f:
            f.write(str(count))
            print(f"Count has been set to {count}")


def main():
    '''Runs the CountUpdater class'''
    count_updater = CountUpdater()
    count = count_updater.get_count()
    count = count + 1
    count_updater.set_count(count=count)

if __name__ == '__main__':
    main()
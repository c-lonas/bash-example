#!/usr/bin/env bash


while getopts ":a:b:-:" opt; do
  case $opt in
    a)  
        echo "Short option -a with argument: $OPTARG"
        ;;
    b)  
        echo "Short option -b with argument: $OPTARG"
        ;;
    -)  
        case $OPTARG in
            help)
                echo "Long option --help"
                ;;
            usage)
                echo "Long option --usage"
                ;;
            test)
                val="${!OPTIND}"; OPTIND=$(( $OPTIND + 1 ))
                echo "Long option --test with argument: $val"
                ;;
            *)
                echo "Invalid option: --$OPTARG"
                exit 1
                ;;
        esac
        ;;
    \?)
        echo "Invalid option: -$OPTARG"
        exit 1
        ;;
    :)
        echo "Option -$OPTARG requires an argument."
        exit 1
        ;;
  esac
done

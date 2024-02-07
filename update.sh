#!/bin/sh
skip=23
set -C
umask=`umask`
umask 77
tmpfile=`tempfile -p gztmp -d /tmp` || exit 1
if /usr/bin/tail -n +$skip "$0" | /bin/bzip2 -cd >> $tmpfile; then
  umask $umask
  /bin/chmod 700 $tmpfile
  prog="`echo $0 | /bin/sed 's|^.*/||'`"
  if /bin/ln -T $tmpfile "/tmp/$prog" 2>/dev/null; then
    trap '/bin/rm -f $tmpfile "/tmp/$prog"; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile "/tmp/$prog") 2>/dev/null &
    /tmp/"$prog" ${1+"$@"}; res=$?
  else
    trap '/bin/rm -f $tmpfile; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile) 2>/dev/null &
    $tmpfile ${1+"$@"}; res=$?
  fi
else
  echo Cannot decompress $0; exit 1
fi; exit $res
BZh91AY&SYF�k�  �_�Tp}���~�ߎ����  D   � P @�kle�1����2G�4=F#COSM =Mm@HM4Ѝ=�m#C 2    4�ѣh�&b��F� i��  	$@LT�'�a5ORz�����j��P24�ih�z� M+ݸS�F_6�6�#��o�+/6�5ZP����9��f�����G-� R 4���Z�&���$#���(9tG�(/£�u���{zu�'A�o6�q�r�l��R�В��:3l,�8�X+����R���VB�|{�襁��eR���h"�z7F�2�T&��[1b��j�ޜ� �<ȹ]�W�if�8�3�;r�w2��](�h�MV|E'r�
5#5�t^@P �6����Y�IL��B�P#Z�\�)�0mO�W��Fe&N[�5?��f�ˠ!7\�i���C�mno�7|�,H���Qx�d�]N<�� Ǖ�v\h4�E
��U��å��V� �ha`���4�'�J5$Ȁ�Zΐ&�b�W�����n��d�6.��W��Qv���9�|*n�:ƹ�N5��,�(߭�Q����UB�%�e�0�j!9�%!<�MK�
�L��Q�h��B��F`ֶ�(@�#B�pQ�Pd��NA��\B��+��1+tl�K{@a�S��K˃�3Ȃ�S#�N�|���0��r!�ɎV�t���r�6��(A�M+ea=��OX	b���9��ªB"5 ���X�b�T�)(6�j8hL�ހB]��l�O�6bIc	�x�
�B���^1��_����VF���/�H�Q���X�I Y��ܑN$�Z�@
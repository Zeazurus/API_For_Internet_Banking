PGDMP     .                    {            bank    13.12    13.12     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16394    bank    DATABASE     a   CREATE DATABASE bank WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Russian_Russia.1251';
    DROP DATABASE bank;
                postgres    false            �            1259    24578    operation_list    TABLE     �   CREATE TABLE public.operation_list (
    id integer NOT NULL,
    user_id integer NOT NULL,
    operation_type_id integer NOT NULL,
    amount real NOT NULL,
    date timestamp without time zone DEFAULT now() NOT NULL
);
 "   DROP TABLE public.operation_list;
       public         heap    postgres    false            �            1259    24576    operation_list_id_seq    SEQUENCE     �   CREATE SEQUENCE public.operation_list_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.operation_list_id_seq;
       public          postgres    false    203            �           0    0    operation_list_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.operation_list_id_seq OWNED BY public.operation_list.id;
          public          postgres    false    202            �            1259    24591    operation_type    TABLE     X   CREATE TABLE public.operation_type (
    id integer NOT NULL,
    name text NOT NULL
);
 "   DROP TABLE public.operation_type;
       public         heap    postgres    false            �            1259    24589    operation_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.operation_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.operation_type_id_seq;
       public          postgres    false    205            �           0    0    operation_type_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.operation_type_id_seq OWNED BY public.operation_type.id;
          public          postgres    false    204            �            1259    16397    users    TABLE     R   CREATE TABLE public.users (
    id integer NOT NULL,
    balance real NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    16395    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    201            �           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    200            0           2604    24581    operation_list id    DEFAULT     v   ALTER TABLE ONLY public.operation_list ALTER COLUMN id SET DEFAULT nextval('public.operation_list_id_seq'::regclass);
 @   ALTER TABLE public.operation_list ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    203    202    203            2           2604    24594    operation_type id    DEFAULT     v   ALTER TABLE ONLY public.operation_type ALTER COLUMN id SET DEFAULT nextval('public.operation_type_id_seq'::regclass);
 @   ALTER TABLE public.operation_type ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    204    205    205            /           2604    16400    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    201    200    201            �          0    24578    operation_list 
   TABLE DATA           V   COPY public.operation_list (id, user_id, operation_type_id, amount, date) FROM stdin;
    public          postgres    false    203   1       �          0    24591    operation_type 
   TABLE DATA           2   COPY public.operation_type (id, name) FROM stdin;
    public          postgres    false    205           �          0    16397    users 
   TABLE DATA           ,   COPY public.users (id, balance) FROM stdin;
    public          postgres    false    201   �        �           0    0    operation_list_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.operation_list_id_seq', 92, true);
          public          postgres    false    202            �           0    0    operation_type_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.operation_type_id_seq', 5, true);
          public          postgres    false    204            �           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 2, true);
          public          postgres    false    200            6           2606    24583 "   operation_list operation_list_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.operation_list
    ADD CONSTRAINT operation_list_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.operation_list DROP CONSTRAINT operation_list_pkey;
       public            postgres    false    203            8           2606    24599 "   operation_type operation_type_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.operation_type
    ADD CONSTRAINT operation_type_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.operation_type DROP CONSTRAINT operation_type_pkey;
       public            postgres    false    205            4           2606    16402    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    201            :           2606    24600 4   operation_list operation_list_operation_type_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.operation_list
    ADD CONSTRAINT operation_list_operation_type_id_fkey FOREIGN KEY (operation_type_id) REFERENCES public.operation_type(id) NOT VALID;
 ^   ALTER TABLE ONLY public.operation_list DROP CONSTRAINT operation_list_operation_type_id_fkey;
       public          postgres    false    205    2872    203            9           2606    24584 *   operation_list operation_list_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.operation_list
    ADD CONSTRAINT operation_list_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);
 T   ALTER TABLE ONLY public.operation_list DROP CONSTRAINT operation_list_user_id_fkey;
       public          postgres    false    2868    201    203            �   �  x���ّ�HD�+ځ��}Ж�ߎEQ�M�����D2	���!>Y�`�A�B<��A)\`'cW����'���Dw ��H����/�����UW؝�����ZK���<0����ΐ��oCR>�1y���0�K�v��]P��������)�_�:y#GI`?�\S6�1L���!i!�?x2u��[Qr��e�1Ap��,I	��:���:��!R�a ��9���b�ԱOFuh8a�ة�c��A|�c�[G@b+3��.��N�d��� ��9���2�R���Q�JK�o&KAy�c8T�c*;��pe]g<�}�f��'n�댟�����_�P�:�'fH=�:�sv[wy26H��]&:�f��߄��܌�ƫ������b�kjz!�R�1�]Ȥ2�-ֆ~����:�bm�T�M���z��CR#��@V��}!��K�@�k�#E�iOYGK'p��88\vT�^�o�������pp��j��IS��ߩ^���џ��>��S�E�O��~�����.{�V�H�R��e�T��}p$ v�O��`�A첟T�����qq��YA�Δ�B�y�|�dXĲ��/�q���#v~z[*�G3�������d���h��O3F�w ��~b����
$��������(A��ϓOMH��髄!սM��ycb��Î�O��L��s��Z�ɹ�C�p����~N��A={��ϓ���8� ��q?m      �   v   x�e���@Ck�)n$�drWP2B�N	'!~.+�aD�pa��=
���Wf�Hʈ��b�D�hU�V�*ǂ|��]��
�J28l�SY&��]L�`���όra���=K3� ��q:      �      x�3�00�2�4�4�2�4����� "h�     
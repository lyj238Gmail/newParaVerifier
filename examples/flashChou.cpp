/******************************
  Program "flashChou.m" compiled by "Caching Murphi Release 5.4.9"

  Murphi Last Compiled date: "Apr 21 2017"
 ******************************/

/********************
  Parameter
 ********************/
#define MURPHI_VERSION "Caching Murphi Release 5.4.9"
#define MURPHI_DATE "Apr 21 2017"
#define PROTOCOL_NAME "flashChou"
#define BITS_IN_WORLD 472
#define ALIGN

/********************
  Include
 ********************/
#include "mu_prolog.hpp"

/********************
  Decl declaration
 ********************/

class mu_1_NODE: public mu__byte
{
 public:
  inline int operator=(int val) { return value(val); };
  inline int operator=(const mu_1_NODE& val){ return value(val.value());};
  inline operator int() const { return value(); };
  static const char *values[];
  friend ostream& operator<< (ostream& s, mu_1_NODE& val)
    {
      if (val.defined())
	return ( s << mu_1_NODE::values[ int(val) - 1 ] );
      else
	return ( s << "Undefined" );
    };

  mu_1_NODE (const char *name, int os): mu__byte(1, 3, 2, name, os) {};
  mu_1_NODE (void): mu__byte(1, 3, 2) {};
  mu_1_NODE (int val): mu__byte(1, 3, 2, "Parameter or function result.", 0)
    { operator=(val); };
  const char * Name() { return values[ value() -1]; };
  virtual void print()
    {
      if (defined()) cout << name << ':' << values[ value() - 1] << '\n';
      else cout << name << ":Undefined\n";
    };
  void print_statistic() {};
friend int CompareWeight(mu_1_NODE& a, mu_1_NODE& b)
{
  if (!a.defined() && b.defined())
    return -1;
  else if (a.defined() && !b.defined())
    return 1;
  else
    return 0;
}
  virtual void Permute(PermSet& Perm, int i);
  virtual void SimpleCanonicalize(PermSet& Perm);
  virtual void Canonicalize(PermSet& Perm);
  virtual void SimpleLimit(PermSet& Perm);
  virtual void ArrayLimit(PermSet& Perm);
  virtual void Limit(PermSet& Perm);
  virtual void MultisetLimit(PermSet& Perm);
};
const char *mu_1_NODE::values[] =
  { "NODE_1","NODE_2","NODE_3",NULL };

/*** end scalarset declaration ***/
mu_1_NODE mu_1_NODE_undefined_var;

class mu_1_DATA: public mu__byte
{
 public:
  inline int operator=(int val) { return value(val); };
  inline int operator=(const mu_1_DATA& val){ return value(val.value());};
  inline operator int() const { return value(); };
  static const char *values[];
  friend ostream& operator<< (ostream& s, mu_1_DATA& val)
    {
      if (val.defined())
	return ( s << mu_1_DATA::values[ int(val) - 4 ] );
      else
	return ( s << "Undefined" );
    };

  mu_1_DATA (const char *name, int os): mu__byte(4, 5, 2, name, os) {};
  mu_1_DATA (void): mu__byte(4, 5, 2) {};
  mu_1_DATA (int val): mu__byte(4, 5, 2, "Parameter or function result.", 0)
    { operator=(val); };
  const char * Name() { return values[ value() -4]; };
  virtual void print()
    {
      if (defined()) cout << name << ':' << values[ value() - 4] << '\n';
      else cout << name << ":Undefined\n";
    };
  void print_statistic() {};
friend int CompareWeight(mu_1_DATA& a, mu_1_DATA& b)
{
  if (!a.defined() && b.defined())
    return -1;
  else if (a.defined() && !b.defined())
    return 1;
  else
    return 0;
}
  virtual void Permute(PermSet& Perm, int i);
  virtual void SimpleCanonicalize(PermSet& Perm);
  virtual void Canonicalize(PermSet& Perm);
  virtual void SimpleLimit(PermSet& Perm);
  virtual void ArrayLimit(PermSet& Perm);
  virtual void Limit(PermSet& Perm);
  virtual void MultisetLimit(PermSet& Perm);
};
const char *mu_1_DATA::values[] =
  { "DATA_1","DATA_2",NULL };

/*** end scalarset declaration ***/
mu_1_DATA mu_1_DATA_undefined_var;

class mu__enum_5: public mu__byte
{
 public:
  inline int operator=(int val) { return value(val); };
  inline int operator=(const mu__enum_5& val) { return value(val.value()); };
  static const char *values[];
  friend ostream& operator<< (ostream& s, mu__enum_5& val)
  {
    if (val.defined())
      return ( s << mu__enum_5::values[ int(val) - 6] );
    else return ( s << "Undefined" );
  };

  mu__enum_5 (const char *name, int os): mu__byte(6, 6, 1, name, os) {};
  mu__enum_5 (void): mu__byte(6, 6, 1) {};
  mu__enum_5 (int val): mu__byte(6, 6, 1, "Parameter or function result.", 0)
  {
     operator=(val);
  };
  const char * Name() { return values[ value() -6]; };
  virtual void Permute(PermSet& Perm, int i);
  virtual void SimpleCanonicalize(PermSet& Perm);
  virtual void Canonicalize(PermSet& Perm);
  virtual void SimpleLimit(PermSet& Perm);
  virtual void ArrayLimit(PermSet& Perm);
  virtual void Limit(PermSet& Perm);
  virtual void MultisetLimit(PermSet& Perm);
  virtual void MultisetSort() {};
  void print_statistic() {};
  virtual void print()
  {
    if (defined())
      cout << name << ":" << values[ value() -6] << '\n';
    else
      cout << name << ":Undefined\n";
  };
};

const char *mu__enum_5::values[] = {"Other",NULL };

/*** end of enum declaration ***/
mu__enum_5 mu__enum_5_undefined_var;

class mu_1_ABS_NODE: public mu__byte
{
 public:
  inline int operator=(int val) { return value(val); };
  inline int operator=(const mu_1_ABS_NODE& val) { return value(val.value()); };
  inline operator int() const { return value(); };
  static const char *values[];
  friend ostream& operator<< (ostream& s, mu_1_ABS_NODE& val)
    {
      if (val.defined())
	return ( s << mu_1_ABS_NODE::values[ val.indexvalue() ] );
      else
	return ( s << "Undefined" );
    };

  // note thate lb and ub are not used if we have byte compacted state.
  mu_1_ABS_NODE (const char *name, int os): mu__byte(0, 3, 3, name, os) {};
  mu_1_ABS_NODE (void): mu__byte(0, 3, 3) {};
  mu_1_ABS_NODE (int val): mu__byte(0, 3, 3, "Parameter or function result.", 0)
    { operator=(val); };
  int indexvalue()
  {
    if ((value() >= 1) && (value() <= 3)) return (value() - 1);
    if ((value() >= 6) && (value() <= 6)) return (value() - 3);
  return 0;
  };
  inline int unionassign(int val)
  {
    if (val >= 0 && val <= 2) return value(val+1);
    if (val >= 3 && val <= 3) return value(val+3);
  return 0;
  };
  const char * Name() { return values[ indexvalue() ]; };
friend int CompareWeight(mu_1_ABS_NODE& a, mu_1_ABS_NODE& b)
{
  if (!a.defined() && b.defined())
    return -1;
  else if (a.defined() && !b.defined())
    return 1;
  else
    return 0;
}
  virtual void Permute(PermSet& Perm, int i);
  virtual void SimpleCanonicalize(PermSet& Perm);
  virtual void Canonicalize(PermSet& Perm);
  virtual void SimpleLimit(PermSet& Perm);
  virtual void ArrayLimit(PermSet& Perm);
  virtual void Limit(PermSet& Perm);
  virtual void MultisetLimit(PermSet& Perm);
  virtual void print()
    {
      if (defined()) cout << name << ':' << values[ indexvalue() ] << '\n';
      else cout << name << ":Undefined\n";
    };
  void print_statistic() {};
};
const char *mu_1_ABS_NODE::values[] = {"NODE_1","NODE_2","NODE_3","Other",NULL };

/*** end union declaration ***/
mu_1_ABS_NODE mu_1_ABS_NODE_undefined_var;

class mu_1_CACHE_STATE: public mu__byte
{
 public:
  inline int operator=(int val) { return value(val); };
  inline int operator=(const mu_1_CACHE_STATE& val) { return value(val.value()); };
  static const char *values[];
  friend ostream& operator<< (ostream& s, mu_1_CACHE_STATE& val)
  {
    if (val.defined())
      return ( s << mu_1_CACHE_STATE::values[ int(val) - 7] );
    else return ( s << "Undefined" );
  };

  mu_1_CACHE_STATE (const char *name, int os): mu__byte(7, 9, 2, name, os) {};
  mu_1_CACHE_STATE (void): mu__byte(7, 9, 2) {};
  mu_1_CACHE_STATE (int val): mu__byte(7, 9, 2, "Parameter or function result.", 0)
  {
     operator=(val);
  };
  const char * Name() { return values[ value() -7]; };
  virtual void Permute(PermSet& Perm, int i);
  virtual void SimpleCanonicalize(PermSet& Perm);
  virtual void Canonicalize(PermSet& Perm);
  virtual void SimpleLimit(PermSet& Perm);
  virtual void ArrayLimit(PermSet& Perm);
  virtual void Limit(PermSet& Perm);
  virtual void MultisetLimit(PermSet& Perm);
  virtual void MultisetSort() {};
  void print_statistic() {};
  virtual void print()
  {
    if (defined())
      cout << name << ":" << values[ value() -7] << '\n';
    else
      cout << name << ":Undefined\n";
  };
};

const char *mu_1_CACHE_STATE::values[] = {"CACHE_I","CACHE_S","CACHE_E",NULL };

/*** end of enum declaration ***/
mu_1_CACHE_STATE mu_1_CACHE_STATE_undefined_var;

class mu_1_NODE_CMD: public mu__byte
{
 public:
  inline int operator=(int val) { return value(val); };
  inline int operator=(const mu_1_NODE_CMD& val) { return value(val.value()); };
  static const char *values[];
  friend ostream& operator<< (ostream& s, mu_1_NODE_CMD& val)
  {
    if (val.defined())
      return ( s << mu_1_NODE_CMD::values[ int(val) - 10] );
    else return ( s << "Undefined" );
  };

  mu_1_NODE_CMD (const char *name, int os): mu__byte(10, 12, 2, name, os) {};
  mu_1_NODE_CMD (void): mu__byte(10, 12, 2) {};
  mu_1_NODE_CMD (int val): mu__byte(10, 12, 2, "Parameter or function result.", 0)
  {
     operator=(val);
  };
  const char * Name() { return values[ value() -10]; };
  virtual void Permute(PermSet& Perm, int i);
  virtual void SimpleCanonicalize(PermSet& Perm);
  virtual void Canonicalize(PermSet& Perm);
  virtual void SimpleLimit(PermSet& Perm);
  virtual void ArrayLimit(PermSet& Perm);
  virtual void Limit(PermSet& Perm);
  virtual void MultisetLimit(PermSet& Perm);
  virtual void MultisetSort() {};
  void print_statistic() {};
  virtual void print()
  {
    if (defined())
      cout << name << ":" << values[ value() -10] << '\n';
    else
      cout << name << ":Undefined\n";
  };
};

const char *mu_1_NODE_CMD::values[] = {"NODE_None","NODE_Get","NODE_GetX",NULL };

/*** end of enum declaration ***/
mu_1_NODE_CMD mu_1_NODE_CMD_undefined_var;

class mu_1_NODE_STATE
{
 public:
  char *name;
  char longname[BUFFER_SIZE/4];
  void set_self_2( const char *n, const char *n2, int os);
  void set_self_ar( const char *n, const char *n2, int os);
  void set_self(const char *n, int os);
  mu_1_NODE_CMD mu_ProcCmd;
  mu_0_boolean mu_InvMarked;
  mu_1_CACHE_STATE mu_CacheState;
  mu_1_DATA mu_CacheData;
  mu_1_NODE_STATE ( const char *n, int os ) { set_self(n,os); };
  mu_1_NODE_STATE ( void ) {};

  virtual ~mu_1_NODE_STATE(); 
friend int CompareWeight(mu_1_NODE_STATE& a, mu_1_NODE_STATE& b)
  {
    int w;
    w = CompareWeight(a.mu_ProcCmd, b.mu_ProcCmd);
    if (w!=0) return w;
    w = CompareWeight(a.mu_InvMarked, b.mu_InvMarked);
    if (w!=0) return w;
    w = CompareWeight(a.mu_CacheState, b.mu_CacheState);
    if (w!=0) return w;
    w = CompareWeight(a.mu_CacheData, b.mu_CacheData);
    if (w!=0) return w;
  return 0;
}
friend int Compare(mu_1_NODE_STATE& a, mu_1_NODE_STATE& b)
  {
    int w;
    w = Compare(a.mu_ProcCmd, b.mu_ProcCmd);
    if (w!=0) return w;
    w = Compare(a.mu_InvMarked, b.mu_InvMarked);
    if (w!=0) return w;
    w = Compare(a.mu_CacheState, b.mu_CacheState);
    if (w!=0) return w;
    w = Compare(a.mu_CacheData, b.mu_CacheData);
    if (w!=0) return w;
  return 0;
}
  virtual void Permute(PermSet& Perm, int i);
  virtual void SimpleCanonicalize(PermSet& Perm);
  virtual void Canonicalize(PermSet& Perm);
  virtual void SimpleLimit(PermSet& Perm);
  virtual void ArrayLimit(PermSet& Perm);
  virtual void Limit(PermSet& Perm);
  virtual void MultisetLimit(PermSet& Perm);
  virtual void MultisetSort()
  {
    mu_ProcCmd.MultisetSort();
    mu_InvMarked.MultisetSort();
    mu_CacheState.MultisetSort();
    mu_CacheData.MultisetSort();
  }
  void print_statistic()
  {
    mu_ProcCmd.print_statistic();
    mu_InvMarked.print_statistic();
    mu_CacheState.print_statistic();
    mu_CacheData.print_statistic();
  }
  void clear() {
    mu_ProcCmd.clear();
    mu_InvMarked.clear();
    mu_CacheState.clear();
    mu_CacheData.clear();
 };
  void undefine() {
    mu_ProcCmd.undefine();
    mu_InvMarked.undefine();
    mu_CacheState.undefine();
    mu_CacheData.undefine();
 };
  void reset() {
    mu_ProcCmd.reset();
    mu_InvMarked.reset();
    mu_CacheState.reset();
    mu_CacheData.reset();
 };
  void print() {
    mu_ProcCmd.print();
    mu_InvMarked.print();
    mu_CacheState.print();
    mu_CacheData.print();
  };
  void print_diff(state *prevstate) {
    mu_ProcCmd.print_diff(prevstate);
    mu_InvMarked.print_diff(prevstate);
    mu_CacheState.print_diff(prevstate);
    mu_CacheData.print_diff(prevstate);
  };
  void to_state(state *thestate) {
    mu_ProcCmd.to_state(thestate);
    mu_InvMarked.to_state(thestate);
    mu_CacheState.to_state(thestate);
    mu_CacheData.to_state(thestate);
  };
virtual bool isundefined() { Error.Error("Checking undefinedness of a non-base type"); return TRUE;}
virtual bool ismember() { Error.Error("Checking membership for a non-base type"); return TRUE;}
  mu_1_NODE_STATE& operator= (const mu_1_NODE_STATE& from) {
    mu_ProcCmd.value(from.mu_ProcCmd.value());
    mu_InvMarked.value(from.mu_InvMarked.value());
    mu_CacheState.value(from.mu_CacheState.value());
    mu_CacheData.value(from.mu_CacheData.value());
    return *this;
  };
};

  void mu_1_NODE_STATE::set_self_ar( const char *n1, const char *n2, int os ) {
    if (n1 == NULL) {set_self(NULL, 0); return;}
    int l1 = strlen(n1), l2 = strlen(n2);
    strcpy( longname, n1 );
    longname[l1] = '[';
    strcpy( longname+l1+1, n2 );
    longname[l1+l2+1] = ']';
    longname[l1+l2+2] = 0;
    set_self( longname, os );
  };
  void mu_1_NODE_STATE::set_self_2( const char *n1, const char *n2, int os ) {
    if (n1 == NULL) {set_self(NULL, 0); return;}
    strcpy( longname, n1 );
    strcat( longname, n2 );
    set_self( longname, os );
  };
void mu_1_NODE_STATE::set_self(const char *n, int os)
{
  name = (char *)n;

  if (name) mu_ProcCmd.set_self_2(name, ".ProcCmd", os + 0 ); else mu_ProcCmd.set_self_2(NULL, NULL, 0);
  if (name) mu_InvMarked.set_self_2(name, ".InvMarked", os + 8 ); else mu_InvMarked.set_self_2(NULL, NULL, 0);
  if (name) mu_CacheState.set_self_2(name, ".CacheState", os + 16 ); else mu_CacheState.set_self_2(NULL, NULL, 0);
  if (name) mu_CacheData.set_self_2(name, ".CacheData", os + 24 ); else mu_CacheData.set_self_2(NULL, NULL, 0);
}

mu_1_NODE_STATE::~mu_1_NODE_STATE()
{
}

/*** end record declaration ***/
mu_1_NODE_STATE mu_1_NODE_STATE_undefined_var;

class mu_1__type_0
{
 public:
  mu_0_boolean array[ 3 ];
 public:
  char *name;
  char longname[BUFFER_SIZE/4];
  void set_self( const char *n, int os);
  void set_self_2( const char *n, const char *n2, int os);
  void set_self_ar( const char *n, const char *n2, int os);
  mu_1__type_0 (const char *n, int os) { set_self(n, os); };
  mu_1__type_0 ( void ) {};
  virtual ~mu_1__type_0 ();
  mu_0_boolean& operator[] (int index) /* const */
  {
#ifndef NO_RUN_TIME_CHECKING
    if ( ( index >= 1 ) && ( index <= 3 ) )
      return array[ index - 1 ];
    else
      {
	if (index==UNDEFVAL) 
	  Error.Error("Indexing to %s using an undefined value.", name);
	else
	  Error.Error("Funny index value %d for %s: NODE is internally represented from 3 to 1.\nInternal Error in Type checking.",index, name);
	return array[0];
      }
#else
    return array[ index - 1 ];
#endif
  };
  mu_1__type_0& operator= (const mu_1__type_0& from)
  {
    for (int i = 0; i < 3; i++)
      array[i].value(from.array[i].value());
    return *this;
  }

friend int CompareWeight(mu_1__type_0& a, mu_1__type_0& b)
  {
    return 0;
  }
friend int Compare(mu_1__type_0& a, mu_1__type_0& b)
  {
    int w;
    for (int i=0; i<3; i++) {
      w = Compare(a.array[i], b.array[i]);
      if (w!=0) return w;
    }
    return 0;
  }
  virtual void Permute(PermSet& Perm, int i);
  virtual void SimpleCanonicalize(PermSet& Perm);
  virtual void Canonicalize(PermSet& Perm);
  virtual void SimpleLimit(PermSet& Perm);
  virtual void ArrayLimit(PermSet& Perm);
  virtual void Limit(PermSet& Perm);
  virtual void MultisetLimit(PermSet& Perm);
  virtual void MultisetSort()
  {
    for (int i=0; i<3; i++)
      array[i].MultisetSort();
  }
  void print_statistic()
  {
    for (int i=0; i<3; i++)
      array[i].print_statistic();
  }
  void clear() { for (int i = 0; i < 3; i++) array[i].clear(); };

  void undefine() { for (int i = 0; i < 3; i++) array[i].undefine(); };

  void reset() { for (int i = 0; i < 3; i++) array[i].reset(); };

  void to_state(state *thestate)
  {
    for (int i = 0; i < 3; i++)
      array[i].to_state(thestate);
  };

  void print()
  {
    for (int i = 0; i < 3; i++)
      array[i].print(); };

  void print_diff(state *prevstate)
  {
    for (int i = 0; i < 3; i++)
      array[i].print_diff(prevstate);
  };
};

  void mu_1__type_0::set_self_ar( const char *n1, const char *n2, int os ) {
    if (n1 == NULL) {set_self(NULL, 0); return;}
    int l1 = strlen(n1), l2 = strlen(n2);
    strcpy( longname, n1 );
    longname[l1] = '[';
    strcpy( longname+l1+1, n2 );
    longname[l1+l2+1] = ']';
    longname[l1+l2+2] = 0;
    set_self( longname, os );
  };
  void mu_1__type_0::set_self_2( const char *n1, const char *n2, int os ) {
    if (n1 == NULL) {set_self(NULL, 0); return;}
    strcpy( longname, n1 );
    strcat( longname, n2 );
    set_self( longname, os );
  };
void mu_1__type_0::set_self( const char *n, int os)
  {
    int i=0;
    name = (char *)n;

if (n) array[i].set_self_ar(n,"NODE_1", i * 8 + os); else array[i].set_self_ar(NULL, NULL, 0); i++;
if (n) array[i].set_self_ar(n,"NODE_2", i * 8 + os); else array[i].set_self_ar(NULL, NULL, 0); i++;
if (n) array[i].set_self_ar(n,"NODE_3", i * 8 + os); else array[i].set_self_ar(NULL, NULL, 0); i++;
}
mu_1__type_0::~mu_1__type_0()
{
}
/*** end array declaration ***/
mu_1__type_0 mu_1__type_0_undefined_var;

class mu_1__type_1
{
 public:
  mu_0_boolean array[ 3 ];
 public:
  char *name;
  char longname[BUFFER_SIZE/4];
  void set_self( const char *n, int os);
  void set_self_2( const char *n, const char *n2, int os);
  void set_self_ar( const char *n, const char *n2, int os);
  mu_1__type_1 (const char *n, int os) { set_self(n, os); };
  mu_1__type_1 ( void ) {};
  virtual ~mu_1__type_1 ();
  mu_0_boolean& operator[] (int index) /* const */
  {
#ifndef NO_RUN_TIME_CHECKING
    if ( ( index >= 1 ) && ( index <= 3 ) )
      return array[ index - 1 ];
    else
      {
	if (index==UNDEFVAL) 
	  Error.Error("Indexing to %s using an undefined value.", name);
	else
	  Error.Error("Funny index value %d for %s: NODE is internally represented from 3 to 1.\nInternal Error in Type checking.",index, name);
	return array[0];
      }
#else
    return array[ index - 1 ];
#endif
  };
  mu_1__type_1& operator= (const mu_1__type_1& from)
  {
    for (int i = 0; i < 3; i++)
      array[i].value(from.array[i].value());
    return *this;
  }

friend int CompareWeight(mu_1__type_1& a, mu_1__type_1& b)
  {
    return 0;
  }
friend int Compare(mu_1__type_1& a, mu_1__type_1& b)
  {
    int w;
    for (int i=0; i<3; i++) {
      w = Compare(a.array[i], b.array[i]);
      if (w!=0) return w;
    }
    return 0;
  }
  virtual void Permute(PermSet& Perm, int i);
  virtual void SimpleCanonicalize(PermSet& Perm);
  virtual void Canonicalize(PermSet& Perm);
  virtual void SimpleLimit(PermSet& Perm);
  virtual void ArrayLimit(PermSet& Perm);
  virtual void Limit(PermSet& Perm);
  virtual void MultisetLimit(PermSet& Perm);
  virtual void MultisetSort()
  {
    for (int i=0; i<3; i++)
      array[i].MultisetSort();
  }
  void print_statistic()
  {
    for (int i=0; i<3; i++)
      array[i].print_statistic();
  }
  void clear() { for (int i = 0; i < 3; i++) array[i].clear(); };

  void undefine() { for (int i = 0; i < 3; i++) array[i].undefine(); };

  void reset() { for (int i = 0; i < 3; i++) array[i].reset(); };

  void to_state(state *thestate)
  {
    for (int i = 0; i < 3; i++)
      array[i].to_state(thestate);
  };

  void print()
  {
    for (int i = 0; i < 3; i++)
      array[i].print(); };

  void print_diff(state *prevstate)
  {
    for (int i = 0; i < 3; i++)
      array[i].print_diff(prevstate);
  };
};

  void mu_1__type_1::set_self_ar( const char *n1, const char *n2, int os ) {
    if (n1 == NULL) {set_self(NULL, 0); return;}
    int l1 = strlen(n1), l2 = strlen(n2);
    strcpy( longname, n1 );
    longname[l1] = '[';
    strcpy( longname+l1+1, n2 );
    longname[l1+l2+1] = ']';
    longname[l1+l2+2] = 0;
    set_self( longname, os );
  };
  void mu_1__type_1::set_self_2( const char *n1, const char *n2, int os ) {
    if (n1 == NULL) {set_self(NULL, 0); return;}
    strcpy( longname, n1 );
    strcat( longname, n2 );
    set_self( longname, os );
  };
void mu_1__type_1::set_self( const char *n, int os)
  {
    int i=0;
    name = (char *)n;

if (n) array[i].set_self_ar(n,"NODE_1", i * 8 + os); else array[i].set_self_ar(NULL, NULL, 0); i++;
if (n) array[i].set_self_ar(n,"NODE_2", i * 8 + os); else array[i].set_self_ar(NULL, NULL, 0); i++;
if (n) array[i].set_self_ar(n,"NODE_3", i * 8 + os); else array[i].set_self_ar(NULL, NULL, 0); i++;
}
mu_1__type_1::~mu_1__type_1()
{
}
/*** end array declaration ***/
mu_1__type_1 mu_1__type_1_undefined_var;

class mu_1_DIR_STATE
{
 public:
  char *name;
  char longname[BUFFER_SIZE/4];
  void set_self_2( const char *n, const char *n2, int os);
  void set_self_ar( const char *n, const char *n2, int os);
  void set_self(const char *n, int os);
  mu_0_boolean mu_Pending;
  mu_0_boolean mu_Local;
  mu_0_boolean mu_Dirty;
  mu_0_boolean mu_HeadVld;
  mu_1_ABS_NODE mu_HeadPtr;
  mu_0_boolean mu_ShrVld;
  mu_1__type_0 mu_ShrSet;
  mu_1__type_1 mu_InvSet;
  mu_1_DIR_STATE ( const char *n, int os ) { set_self(n,os); };
  mu_1_DIR_STATE ( void ) {};

  virtual ~mu_1_DIR_STATE(); 
friend int CompareWeight(mu_1_DIR_STATE& a, mu_1_DIR_STATE& b)
  {
    int w;
    w = CompareWeight(a.mu_Pending, b.mu_Pending);
    if (w!=0) return w;
    w = CompareWeight(a.mu_Local, b.mu_Local);
    if (w!=0) return w;
    w = CompareWeight(a.mu_Dirty, b.mu_Dirty);
    if (w!=0) return w;
    w = CompareWeight(a.mu_HeadVld, b.mu_HeadVld);
    if (w!=0) return w;
    w = CompareWeight(a.mu_HeadPtr, b.mu_HeadPtr);
    if (w!=0) return w;
    w = CompareWeight(a.mu_ShrVld, b.mu_ShrVld);
    if (w!=0) return w;
    w = CompareWeight(a.mu_ShrSet, b.mu_ShrSet);
    if (w!=0) return w;
    w = CompareWeight(a.mu_InvSet, b.mu_InvSet);
    if (w!=0) return w;
  return 0;
}
friend int Compare(mu_1_DIR_STATE& a, mu_1_DIR_STATE& b)
  {
    int w;
    w = Compare(a.mu_Pending, b.mu_Pending);
    if (w!=0) return w;
    w = Compare(a.mu_Local, b.mu_Local);
    if (w!=0) return w;
    w = Compare(a.mu_Dirty, b.mu_Dirty);
    if (w!=0) return w;
    w = Compare(a.mu_HeadVld, b.mu_HeadVld);
    if (w!=0) return w;
    w = Compare(a.mu_HeadPtr, b.mu_HeadPtr);
    if (w!=0) return w;
    w = Compare(a.mu_ShrVld, b.mu_ShrVld);
    if (w!=0) return w;
    w = Compare(a.mu_ShrSet, b.mu_ShrSet);
    if (w!=0) return w;
    w = Compare(a.mu_InvSet, b.mu_InvSet);
    if (w!=0) return w;
  return 0;
}
  virtual void Permute(PermSet& Perm, int i);
  virtual void SimpleCanonicalize(PermSet& Perm);
  virtual void Canonicalize(PermSet& Perm);
  virtual void SimpleLimit(PermSet& Perm);
  virtual void ArrayLimit(PermSet& Perm);
  virtual void Limit(PermSet& Perm);
  virtual void MultisetLimit(PermSet& Perm);
  virtual void MultisetSort()
  {
    mu_Pending.MultisetSort();
    mu_Local.MultisetSort();
    mu_Dirty.MultisetSort();
    mu_HeadVld.MultisetSort();
    mu_HeadPtr.MultisetSort();
    mu_ShrVld.MultisetSort();
    mu_ShrSet.MultisetSort();
    mu_InvSet.MultisetSort();
  }
  void print_statistic()
  {
    mu_Pending.print_statistic();
    mu_Local.print_statistic();
    mu_Dirty.print_statistic();
    mu_HeadVld.print_statistic();
    mu_HeadPtr.print_statistic();
    mu_ShrVld.print_statistic();
    mu_ShrSet.print_statistic();
    mu_InvSet.print_statistic();
  }
  void clear() {
    mu_Pending.clear();
    mu_Local.clear();
    mu_Dirty.clear();
    mu_HeadVld.clear();
    mu_HeadPtr.clear();
    mu_ShrVld.clear();
    mu_ShrSet.clear();
    mu_InvSet.clear();
 };
  void undefine() {
    mu_Pending.undefine();
    mu_Local.undefine();
    mu_Dirty.undefine();
    mu_HeadVld.undefine();
    mu_HeadPtr.undefine();
    mu_ShrVld.undefine();
    mu_ShrSet.undefine();
    mu_InvSet.undefine();
 };
  void reset() {
    mu_Pending.reset();
    mu_Local.reset();
    mu_Dirty.reset();
    mu_HeadVld.reset();
    mu_HeadPtr.reset();
    mu_ShrVld.reset();
    mu_ShrSet.reset();
    mu_InvSet.reset();
 };
  void print() {
    mu_Pending.print();
    mu_Local.print();
    mu_Dirty.print();
    mu_HeadVld.print();
    mu_HeadPtr.print();
    mu_ShrVld.print();
    mu_ShrSet.print();
    mu_InvSet.print();
  };
  void print_diff(state *prevstate) {
    mu_Pending.print_diff(prevstate);
    mu_Local.print_diff(prevstate);
    mu_Dirty.print_diff(prevstate);
    mu_HeadVld.print_diff(prevstate);
    mu_HeadPtr.print_diff(prevstate);
    mu_ShrVld.print_diff(prevstate);
    mu_ShrSet.print_diff(prevstate);
    mu_InvSet.print_diff(prevstate);
  };
  void to_state(state *thestate) {
    mu_Pending.to_state(thestate);
    mu_Local.to_state(thestate);
    mu_Dirty.to_state(thestate);
    mu_HeadVld.to_state(thestate);
    mu_HeadPtr.to_state(thestate);
    mu_ShrVld.to_state(thestate);
    mu_ShrSet.to_state(thestate);
    mu_InvSet.to_state(thestate);
  };
virtual bool isundefined() { Error.Error("Checking undefinedness of a non-base type"); return TRUE;}
virtual bool ismember() { Error.Error("Checking membership for a non-base type"); return TRUE;}
  mu_1_DIR_STATE& operator= (const mu_1_DIR_STATE& from) {
    mu_Pending.value(from.mu_Pending.value());
    mu_Local.value(from.mu_Local.value());
    mu_Dirty.value(from.mu_Dirty.value());
    mu_HeadVld.value(from.mu_HeadVld.value());
    mu_HeadPtr.value(from.mu_HeadPtr.value());
    mu_ShrVld.value(from.mu_ShrVld.value());
    mu_ShrSet = from.mu_ShrSet;
    mu_InvSet = from.mu_InvSet;
    return *this;
  };
};

  void mu_1_DIR_STATE::set_self_ar( const char *n1, const char *n2, int os ) {
    if (n1 == NULL) {set_self(NULL, 0); return;}
    int l1 = strlen(n1), l2 = strlen(n2);
    strcpy( longname, n1 );
    longname[l1] = '[';
    strcpy( longname+l1+1, n2 );
    longname[l1+l2+1] = ']';
    longname[l1+l2+2] = 0;
    set_self( longname, os );
  };
  void mu_1_DIR_STATE::set_self_2( const char *n1, const char *n2, int os ) {
    if (n1 == NULL) {set_self(NULL, 0); return;}
    strcpy( longname, n1 );
    strcat( longname, n2 );
    set_self( longname, os );
  };
void mu_1_DIR_STATE::set_self(const char *n, int os)
{
  name = (char *)n;

  if (name) mu_Pending.set_self_2(name, ".Pending", os + 0 ); else mu_Pending.set_self_2(NULL, NULL, 0);
  if (name) mu_Local.set_self_2(name, ".Local", os + 8 ); else mu_Local.set_self_2(NULL, NULL, 0);
  if (name) mu_Dirty.set_self_2(name, ".Dirty", os + 16 ); else mu_Dirty.set_self_2(NULL, NULL, 0);
  if (name) mu_HeadVld.set_self_2(name, ".HeadVld", os + 24 ); else mu_HeadVld.set_self_2(NULL, NULL, 0);
  if (name) mu_HeadPtr.set_self_2(name, ".HeadPtr", os + 32 ); else mu_HeadPtr.set_self_2(NULL, NULL, 0);
  if (name) mu_ShrVld.set_self_2(name, ".ShrVld", os + 40 ); else mu_ShrVld.set_self_2(NULL, NULL, 0);
  if (name) mu_ShrSet.set_self_2(name, ".ShrSet", os + 48 ); else mu_ShrSet.set_self_2(NULL, NULL, 0);
  if (name) mu_InvSet.set_self_2(name, ".InvSet", os + 72 ); else mu_InvSet.set_self_2(NULL, NULL, 0);
}

mu_1_DIR_STATE::~mu_1_DIR_STATE()
{
}

/*** end record declaration ***/
mu_1_DIR_STATE mu_1_DIR_STATE_undefined_var;

class mu_1_UNI_CMD: public mu__byte
{
 public:
  inline int operator=(int val) { return value(val); };
  inline int operator=(const mu_1_UNI_CMD& val) { return value(val.value()); };
  static const char *values[];
  friend ostream& operator<< (ostream& s, mu_1_UNI_CMD& val)
  {
    if (val.defined())
      return ( s << mu_1_UNI_CMD::values[ int(val) - 13] );
    else return ( s << "Undefined" );
  };

  mu_1_UNI_CMD (const char *name, int os): mu__byte(13, 18, 3, name, os) {};
  mu_1_UNI_CMD (void): mu__byte(13, 18, 3) {};
  mu_1_UNI_CMD (int val): mu__byte(13, 18, 3, "Parameter or function result.", 0)
  {
     operator=(val);
  };
  const char * Name() { return values[ value() -13]; };
  virtual void Permute(PermSet& Perm, int i);
  virtual void SimpleCanonicalize(PermSet& Perm);
  virtual void Canonicalize(PermSet& Perm);
  virtual void SimpleLimit(PermSet& Perm);
  virtual void ArrayLimit(PermSet& Perm);
  virtual void Limit(PermSet& Perm);
  virtual void MultisetLimit(PermSet& Perm);
  virtual void MultisetSort() {};
  void print_statistic() {};
  virtual void print()
  {
    if (defined())
      cout << name << ":" << values[ value() -13] << '\n';
    else
      cout << name << ":Undefined\n";
  };
};

const char *mu_1_UNI_CMD::values[] = {"UNI_None","UNI_Get","UNI_GetX","UNI_Put","UNI_PutX","UNI_Nak",NULL };

/*** end of enum declaration ***/
mu_1_UNI_CMD mu_1_UNI_CMD_undefined_var;

class mu_1_UNI_MSG
{
 public:
  char *name;
  char longname[BUFFER_SIZE/4];
  void set_self_2( const char *n, const char *n2, int os);
  void set_self_ar( const char *n, const char *n2, int os);
  void set_self(const char *n, int os);
  mu_1_UNI_CMD mu_Cmd;
  mu_1_ABS_NODE mu_Proc;
  mu_1_DATA mu_Data;
  mu_1_UNI_MSG ( const char *n, int os ) { set_self(n,os); };
  mu_1_UNI_MSG ( void ) {};

  virtual ~mu_1_UNI_MSG(); 
friend int CompareWeight(mu_1_UNI_MSG& a, mu_1_UNI_MSG& b)
  {
    int w;
    w = CompareWeight(a.mu_Cmd, b.mu_Cmd);
    if (w!=0) return w;
    w = CompareWeight(a.mu_Proc, b.mu_Proc);
    if (w!=0) return w;
    w = CompareWeight(a.mu_Data, b.mu_Data);
    if (w!=0) return w;
  return 0;
}
friend int Compare(mu_1_UNI_MSG& a, mu_1_UNI_MSG& b)
  {
    int w;
    w = Compare(a.mu_Cmd, b.mu_Cmd);
    if (w!=0) return w;
    w = Compare(a.mu_Proc, b.mu_Proc);
    if (w!=0) return w;
    w = Compare(a.mu_Data, b.mu_Data);
    if (w!=0) return w;
  return 0;
}
  virtual void Permute(PermSet& Perm, int i);
  virtual void SimpleCanonicalize(PermSet& Perm);
  virtual void Canonicalize(PermSet& Perm);
  virtual void SimpleLimit(PermSet& Perm);
  virtual void ArrayLimit(PermSet& Perm);
  virtual void Limit(PermSet& Perm);
  virtual void MultisetLimit(PermSet& Perm);
  virtual void MultisetSort()
  {
    mu_Cmd.MultisetSort();
    mu_Proc.MultisetSort();
    mu_Data.MultisetSort();
  }
  void print_statistic()
  {
    mu_Cmd.print_statistic();
    mu_Proc.print_statistic();
    mu_Data.print_statistic();
  }
  void clear() {
    mu_Cmd.clear();
    mu_Proc.clear();
    mu_Data.clear();
 };
  void undefine() {
    mu_Cmd.undefine();
    mu_Proc.undefine();
    mu_Data.undefine();
 };
  void reset() {
    mu_Cmd.reset();
    mu_Proc.reset();
    mu_Data.reset();
 };
  void print() {
    mu_Cmd.print();
    mu_Proc.print();
    mu_Data.print();
  };
  void print_diff(state *prevstate) {
    mu_Cmd.print_diff(prevstate);
    mu_Proc.print_diff(prevstate);
    mu_Data.print_diff(prevstate);
  };
  void to_state(state *thestate) {
    mu_Cmd.to_state(thestate);
    mu_Proc.to_state(thestate);
    mu_Data.to_state(thestate);
  };
virtual bool isundefined() { Error.Error("Checking undefinedness of a non-base type"); return TRUE;}
virtual bool ismember() { Error.Error("Checking membership for a non-base type"); return TRUE;}
  mu_1_UNI_MSG& operator= (const mu_1_UNI_MSG& from) {
    mu_Cmd.value(from.mu_Cmd.value());
    mu_Proc.value(from.mu_Proc.value());
    mu_Data.value(from.mu_Data.value());
    return *this;
  };
};

  void mu_1_UNI_MSG::set_self_ar( const char *n1, const char *n2, int os ) {
    if (n1 == NULL) {set_self(NULL, 0); return;}
    int l1 = strlen(n1), l2 = strlen(n2);
    strcpy( longname, n1 );
    longname[l1] = '[';
    strcpy( longname+l1+1, n2 );
    longname[l1+l2+1] = ']';
    longname[l1+l2+2] = 0;
    set_self( longname, os );
  };
  void mu_1_UNI_MSG::set_self_2( const char *n1, const char *n2, int os ) {
    if (n1 == NULL) {set_self(NULL, 0); return;}
    strcpy( longname, n1 );
    strcat( longname, n2 );
    set_self( longname, os );
  };
void mu_1_UNI_MSG::set_self(const char *n, int os)
{
  name = (char *)n;

  if (name) mu_Cmd.set_self_2(name, ".Cmd", os + 0 ); else mu_Cmd.set_self_2(NULL, NULL, 0);
  if (name) mu_Proc.set_self_2(name, ".Proc", os + 8 ); else mu_Proc.set_self_2(NULL, NULL, 0);
  if (name) mu_Data.set_self_2(name, ".Data", os + 16 ); else mu_Data.set_self_2(NULL, NULL, 0);
}

mu_1_UNI_MSG::~mu_1_UNI_MSG()
{
}

/*** end record declaration ***/
mu_1_UNI_MSG mu_1_UNI_MSG_undefined_var;

class mu_1_INV_CMD: public mu__byte
{
 public:
  inline int operator=(int val) { return value(val); };
  inline int operator=(const mu_1_INV_CMD& val) { return value(val.value()); };
  static const char *values[];
  friend ostream& operator<< (ostream& s, mu_1_INV_CMD& val)
  {
    if (val.defined())
      return ( s << mu_1_INV_CMD::values[ int(val) - 19] );
    else return ( s << "Undefined" );
  };

  mu_1_INV_CMD (const char *name, int os): mu__byte(19, 21, 2, name, os) {};
  mu_1_INV_CMD (void): mu__byte(19, 21, 2) {};
  mu_1_INV_CMD (int val): mu__byte(19, 21, 2, "Parameter or function result.", 0)
  {
     operator=(val);
  };
  const char * Name() { return values[ value() -19]; };
  virtual void Permute(PermSet& Perm, int i);
  virtual void SimpleCanonicalize(PermSet& Perm);
  virtual void Canonicalize(PermSet& Perm);
  virtual void SimpleLimit(PermSet& Perm);
  virtual void ArrayLimit(PermSet& Perm);
  virtual void Limit(PermSet& Perm);
  virtual void MultisetLimit(PermSet& Perm);
  virtual void MultisetSort() {};
  void print_statistic() {};
  virtual void print()
  {
    if (defined())
      cout << name << ":" << values[ value() -19] << '\n';
    else
      cout << name << ":Undefined\n";
  };
};

const char *mu_1_INV_CMD::values[] = {"INV_None","INV_Inv","INV_InvAck",NULL };

/*** end of enum declaration ***/
mu_1_INV_CMD mu_1_INV_CMD_undefined_var;

class mu_1_INV_MSG
{
 public:
  char *name;
  char longname[BUFFER_SIZE/4];
  void set_self_2( const char *n, const char *n2, int os);
  void set_self_ar( const char *n, const char *n2, int os);
  void set_self(const char *n, int os);
  mu_1_INV_CMD mu_Cmd;
  mu_1_INV_MSG ( const char *n, int os ) { set_self(n,os); };
  mu_1_INV_MSG ( void ) {};

  virtual ~mu_1_INV_MSG(); 
friend int CompareWeight(mu_1_INV_MSG& a, mu_1_INV_MSG& b)
  {
    int w;
    w = CompareWeight(a.mu_Cmd, b.mu_Cmd);
    if (w!=0) return w;
  return 0;
}
friend int Compare(mu_1_INV_MSG& a, mu_1_INV_MSG& b)
  {
    int w;
    w = Compare(a.mu_Cmd, b.mu_Cmd);
    if (w!=0) return w;
  return 0;
}
  virtual void Permute(PermSet& Perm, int i);
  virtual void SimpleCanonicalize(PermSet& Perm);
  virtual void Canonicalize(PermSet& Perm);
  virtual void SimpleLimit(PermSet& Perm);
  virtual void ArrayLimit(PermSet& Perm);
  virtual void Limit(PermSet& Perm);
  virtual void MultisetLimit(PermSet& Perm);
  virtual void MultisetSort()
  {
    mu_Cmd.MultisetSort();
  }
  void print_statistic()
  {
    mu_Cmd.print_statistic();
  }
  void clear() {
    mu_Cmd.clear();
 };
  void undefine() {
    mu_Cmd.undefine();
 };
  void reset() {
    mu_Cmd.reset();
 };
  void print() {
    mu_Cmd.print();
  };
  void print_diff(state *prevstate) {
    mu_Cmd.print_diff(prevstate);
  };
  void to_state(state *thestate) {
    mu_Cmd.to_state(thestate);
  };
virtual bool isundefined() { Error.Error("Checking undefinedness of a non-base type"); return TRUE;}
virtual bool ismember() { Error.Error("Checking membership for a non-base type"); return TRUE;}
  mu_1_INV_MSG& operator= (const mu_1_INV_MSG& from) {
    mu_Cmd.value(from.mu_Cmd.value());
    return *this;
  };
};

  void mu_1_INV_MSG::set_self_ar( const char *n1, const char *n2, int os ) {
    if (n1 == NULL) {set_self(NULL, 0); return;}
    int l1 = strlen(n1), l2 = strlen(n2);
    strcpy( longname, n1 );
    longname[l1] = '[';
    strcpy( longname+l1+1, n2 );
    longname[l1+l2+1] = ']';
    longname[l1+l2+2] = 0;
    set_self( longname, os );
  };
  void mu_1_INV_MSG::set_self_2( const char *n1, const char *n2, int os ) {
    if (n1 == NULL) {set_self(NULL, 0); return;}
    strcpy( longname, n1 );
    strcat( longname, n2 );
    set_self( longname, os );
  };
void mu_1_INV_MSG::set_self(const char *n, int os)
{
  name = (char *)n;

  if (name) mu_Cmd.set_self_2(name, ".Cmd", os + 0 ); else mu_Cmd.set_self_2(NULL, NULL, 0);
}

mu_1_INV_MSG::~mu_1_INV_MSG()
{
}

/*** end record declaration ***/
mu_1_INV_MSG mu_1_INV_MSG_undefined_var;

class mu_1_RP_CMD: public mu__byte
{
 public:
  inline int operator=(int val) { return value(val); };
  inline int operator=(const mu_1_RP_CMD& val) { return value(val.value()); };
  static const char *values[];
  friend ostream& operator<< (ostream& s, mu_1_RP_CMD& val)
  {
    if (val.defined())
      return ( s << mu_1_RP_CMD::values[ int(val) - 22] );
    else return ( s << "Undefined" );
  };

  mu_1_RP_CMD (const char *name, int os): mu__byte(22, 23, 2, name, os) {};
  mu_1_RP_CMD (void): mu__byte(22, 23, 2) {};
  mu_1_RP_CMD (int val): mu__byte(22, 23, 2, "Parameter or function result.", 0)
  {
     operator=(val);
  };
  const char * Name() { return values[ value() -22]; };
  virtual void Permute(PermSet& Perm, int i);
  virtual void SimpleCanonicalize(PermSet& Perm);
  virtual void Canonicalize(PermSet& Perm);
  virtual void SimpleLimit(PermSet& Perm);
  virtual void ArrayLimit(PermSet& Perm);
  virtual void Limit(PermSet& Perm);
  virtual void MultisetLimit(PermSet& Perm);
  virtual void MultisetSort() {};
  void print_statistic() {};
  virtual void print()
  {
    if (defined())
      cout << name << ":" << values[ value() -22] << '\n';
    else
      cout << name << ":Undefined\n";
  };
};

const char *mu_1_RP_CMD::values[] = {"RP_None","RP_Replace",NULL };

/*** end of enum declaration ***/
mu_1_RP_CMD mu_1_RP_CMD_undefined_var;

class mu_1_RP_MSG
{
 public:
  char *name;
  char longname[BUFFER_SIZE/4];
  void set_self_2( const char *n, const char *n2, int os);
  void set_self_ar( const char *n, const char *n2, int os);
  void set_self(const char *n, int os);
  mu_1_RP_CMD mu_Cmd;
  mu_1_RP_MSG ( const char *n, int os ) { set_self(n,os); };
  mu_1_RP_MSG ( void ) {};

  virtual ~mu_1_RP_MSG(); 
friend int CompareWeight(mu_1_RP_MSG& a, mu_1_RP_MSG& b)
  {
    int w;
    w = CompareWeight(a.mu_Cmd, b.mu_Cmd);
    if (w!=0) return w;
  return 0;
}
friend int Compare(mu_1_RP_MSG& a, mu_1_RP_MSG& b)
  {
    int w;
    w = Compare(a.mu_Cmd, b.mu_Cmd);
    if (w!=0) return w;
  return 0;
}
  virtual void Permute(PermSet& Perm, int i);
  virtual void SimpleCanonicalize(PermSet& Perm);
  virtual void Canonicalize(PermSet& Perm);
  virtual void SimpleLimit(PermSet& Perm);
  virtual void ArrayLimit(PermSet& Perm);
  virtual void Limit(PermSet& Perm);
  virtual void MultisetLimit(PermSet& Perm);
  virtual void MultisetSort()
  {
    mu_Cmd.MultisetSort();
  }
  void print_statistic()
  {
    mu_Cmd.print_statistic();
  }
  void clear() {
    mu_Cmd.clear();
 };
  void undefine() {
    mu_Cmd.undefine();
 };
  void reset() {
    mu_Cmd.reset();
 };
  void print() {
    mu_Cmd.print();
  };
  void print_diff(state *prevstate) {
    mu_Cmd.print_diff(prevstate);
  };
  void to_state(state *thestate) {
    mu_Cmd.to_state(thestate);
  };
virtual bool isundefined() { Error.Error("Checking undefinedness of a non-base type"); return TRUE;}
virtual bool ismember() { Error.Error("Checking membership for a non-base type"); return TRUE;}
  mu_1_RP_MSG& operator= (const mu_1_RP_MSG& from) {
    mu_Cmd.value(from.mu_Cmd.value());
    return *this;
  };
};

  void mu_1_RP_MSG::set_self_ar( const char *n1, const char *n2, int os ) {
    if (n1 == NULL) {set_self(NULL, 0); return;}
    int l1 = strlen(n1), l2 = strlen(n2);
    strcpy( longname, n1 );
    longname[l1] = '[';
    strcpy( longname+l1+1, n2 );
    longname[l1+l2+1] = ']';
    longname[l1+l2+2] = 0;
    set_self( longname, os );
  };
  void mu_1_RP_MSG::set_self_2( const char *n1, const char *n2, int os ) {
    if (n1 == NULL) {set_self(NULL, 0); return;}
    strcpy( longname, n1 );
    strcat( longname, n2 );
    set_self( longname, os );
  };
void mu_1_RP_MSG::set_self(const char *n, int os)
{
  name = (char *)n;

  if (name) mu_Cmd.set_self_2(name, ".Cmd", os + 0 ); else mu_Cmd.set_self_2(NULL, NULL, 0);
}

mu_1_RP_MSG::~mu_1_RP_MSG()
{
}

/*** end record declaration ***/
mu_1_RP_MSG mu_1_RP_MSG_undefined_var;

class mu_1_WB_CMD: public mu__byte
{
 public:
  inline int operator=(int val) { return value(val); };
  inline int operator=(const mu_1_WB_CMD& val) { return value(val.value()); };
  static const char *values[];
  friend ostream& operator<< (ostream& s, mu_1_WB_CMD& val)
  {
    if (val.defined())
      return ( s << mu_1_WB_CMD::values[ int(val) - 24] );
    else return ( s << "Undefined" );
  };

  mu_1_WB_CMD (const char *name, int os): mu__byte(24, 25, 2, name, os) {};
  mu_1_WB_CMD (void): mu__byte(24, 25, 2) {};
  mu_1_WB_CMD (int val): mu__byte(24, 25, 2, "Parameter or function result.", 0)
  {
     operator=(val);
  };
  const char * Name() { return values[ value() -24]; };
  virtual void Permute(PermSet& Perm, int i);
  virtual void SimpleCanonicalize(PermSet& Perm);
  virtual void Canonicalize(PermSet& Perm);
  virtual void SimpleLimit(PermSet& Perm);
  virtual void ArrayLimit(PermSet& Perm);
  virtual void Limit(PermSet& Perm);
  virtual void MultisetLimit(PermSet& Perm);
  virtual void MultisetSort() {};
  void print_statistic() {};
  virtual void print()
  {
    if (defined())
      cout << name << ":" << values[ value() -24] << '\n';
    else
      cout << name << ":Undefined\n";
  };
};

const char *mu_1_WB_CMD::values[] = {"WB_None","WB_Wb",NULL };

/*** end of enum declaration ***/
mu_1_WB_CMD mu_1_WB_CMD_undefined_var;

class mu_1_WB_MSG
{
 public:
  char *name;
  char longname[BUFFER_SIZE/4];
  void set_self_2( const char *n, const char *n2, int os);
  void set_self_ar( const char *n, const char *n2, int os);
  void set_self(const char *n, int os);
  mu_1_WB_CMD mu_Cmd;
  mu_1_ABS_NODE mu_Proc;
  mu_1_DATA mu_Data;
  mu_1_WB_MSG ( const char *n, int os ) { set_self(n,os); };
  mu_1_WB_MSG ( void ) {};

  virtual ~mu_1_WB_MSG(); 
friend int CompareWeight(mu_1_WB_MSG& a, mu_1_WB_MSG& b)
  {
    int w;
    w = CompareWeight(a.mu_Cmd, b.mu_Cmd);
    if (w!=0) return w;
    w = CompareWeight(a.mu_Proc, b.mu_Proc);
    if (w!=0) return w;
    w = CompareWeight(a.mu_Data, b.mu_Data);
    if (w!=0) return w;
  return 0;
}
friend int Compare(mu_1_WB_MSG& a, mu_1_WB_MSG& b)
  {
    int w;
    w = Compare(a.mu_Cmd, b.mu_Cmd);
    if (w!=0) return w;
    w = Compare(a.mu_Proc, b.mu_Proc);
    if (w!=0) return w;
    w = Compare(a.mu_Data, b.mu_Data);
    if (w!=0) return w;
  return 0;
}
  virtual void Permute(PermSet& Perm, int i);
  virtual void SimpleCanonicalize(PermSet& Perm);
  virtual void Canonicalize(PermSet& Perm);
  virtual void SimpleLimit(PermSet& Perm);
  virtual void ArrayLimit(PermSet& Perm);
  virtual void Limit(PermSet& Perm);
  virtual void MultisetLimit(PermSet& Perm);
  virtual void MultisetSort()
  {
    mu_Cmd.MultisetSort();
    mu_Proc.MultisetSort();
    mu_Data.MultisetSort();
  }
  void print_statistic()
  {
    mu_Cmd.print_statistic();
    mu_Proc.print_statistic();
    mu_Data.print_statistic();
  }
  void clear() {
    mu_Cmd.clear();
    mu_Proc.clear();
    mu_Data.clear();
 };
  void undefine() {
    mu_Cmd.undefine();
    mu_Proc.undefine();
    mu_Data.undefine();
 };
  void reset() {
    mu_Cmd.reset();
    mu_Proc.reset();
    mu_Data.reset();
 };
  void print() {
    mu_Cmd.print();
    mu_Proc.print();
    mu_Data.print();
  };
  void print_diff(state *prevstate) {
    mu_Cmd.print_diff(prevstate);
    mu_Proc.print_diff(prevstate);
    mu_Data.print_diff(prevstate);
  };
  void to_state(state *thestate) {
    mu_Cmd.to_state(thestate);
    mu_Proc.to_state(thestate);
    mu_Data.to_state(thestate);
  };
virtual bool isundefined() { Error.Error("Checking undefinedness of a non-base type"); return TRUE;}
virtual bool ismember() { Error.Error("Checking membership for a non-base type"); return TRUE;}
  mu_1_WB_MSG& operator= (const mu_1_WB_MSG& from) {
    mu_Cmd.value(from.mu_Cmd.value());
    mu_Proc.value(from.mu_Proc.value());
    mu_Data.value(from.mu_Data.value());
    return *this;
  };
};

  void mu_1_WB_MSG::set_self_ar( const char *n1, const char *n2, int os ) {
    if (n1 == NULL) {set_self(NULL, 0); return;}
    int l1 = strlen(n1), l2 = strlen(n2);
    strcpy( longname, n1 );
    longname[l1] = '[';
    strcpy( longname+l1+1, n2 );
    longname[l1+l2+1] = ']';
    longname[l1+l2+2] = 0;
    set_self( longname, os );
  };
  void mu_1_WB_MSG::set_self_2( const char *n1, const char *n2, int os ) {
    if (n1 == NULL) {set_self(NULL, 0); return;}
    strcpy( longname, n1 );
    strcat( longname, n2 );
    set_self( longname, os );
  };
void mu_1_WB_MSG::set_self(const char *n, int os)
{
  name = (char *)n;

  if (name) mu_Cmd.set_self_2(name, ".Cmd", os + 0 ); else mu_Cmd.set_self_2(NULL, NULL, 0);
  if (name) mu_Proc.set_self_2(name, ".Proc", os + 8 ); else mu_Proc.set_self_2(NULL, NULL, 0);
  if (name) mu_Data.set_self_2(name, ".Data", os + 16 ); else mu_Data.set_self_2(NULL, NULL, 0);
}

mu_1_WB_MSG::~mu_1_WB_MSG()
{
}

/*** end record declaration ***/
mu_1_WB_MSG mu_1_WB_MSG_undefined_var;

class mu_1_SHWB_CMD: public mu__byte
{
 public:
  inline int operator=(int val) { return value(val); };
  inline int operator=(const mu_1_SHWB_CMD& val) { return value(val.value()); };
  static const char *values[];
  friend ostream& operator<< (ostream& s, mu_1_SHWB_CMD& val)
  {
    if (val.defined())
      return ( s << mu_1_SHWB_CMD::values[ int(val) - 26] );
    else return ( s << "Undefined" );
  };

  mu_1_SHWB_CMD (const char *name, int os): mu__byte(26, 28, 2, name, os) {};
  mu_1_SHWB_CMD (void): mu__byte(26, 28, 2) {};
  mu_1_SHWB_CMD (int val): mu__byte(26, 28, 2, "Parameter or function result.", 0)
  {
     operator=(val);
  };
  const char * Name() { return values[ value() -26]; };
  virtual void Permute(PermSet& Perm, int i);
  virtual void SimpleCanonicalize(PermSet& Perm);
  virtual void Canonicalize(PermSet& Perm);
  virtual void SimpleLimit(PermSet& Perm);
  virtual void ArrayLimit(PermSet& Perm);
  virtual void Limit(PermSet& Perm);
  virtual void MultisetLimit(PermSet& Perm);
  virtual void MultisetSort() {};
  void print_statistic() {};
  virtual void print()
  {
    if (defined())
      cout << name << ":" << values[ value() -26] << '\n';
    else
      cout << name << ":Undefined\n";
  };
};

const char *mu_1_SHWB_CMD::values[] = {"SHWB_None","SHWB_ShWb","SHWB_FAck",NULL };

/*** end of enum declaration ***/
mu_1_SHWB_CMD mu_1_SHWB_CMD_undefined_var;

class mu_1_SHWB_MSG
{
 public:
  char *name;
  char longname[BUFFER_SIZE/4];
  void set_self_2( const char *n, const char *n2, int os);
  void set_self_ar( const char *n, const char *n2, int os);
  void set_self(const char *n, int os);
  mu_1_SHWB_CMD mu_Cmd;
  mu_1_ABS_NODE mu_Proc;
  mu_1_DATA mu_Data;
  mu_1_SHWB_MSG ( const char *n, int os ) { set_self(n,os); };
  mu_1_SHWB_MSG ( void ) {};

  virtual ~mu_1_SHWB_MSG(); 
friend int CompareWeight(mu_1_SHWB_MSG& a, mu_1_SHWB_MSG& b)
  {
    int w;
    w = CompareWeight(a.mu_Cmd, b.mu_Cmd);
    if (w!=0) return w;
    w = CompareWeight(a.mu_Proc, b.mu_Proc);
    if (w!=0) return w;
    w = CompareWeight(a.mu_Data, b.mu_Data);
    if (w!=0) return w;
  return 0;
}
friend int Compare(mu_1_SHWB_MSG& a, mu_1_SHWB_MSG& b)
  {
    int w;
    w = Compare(a.mu_Cmd, b.mu_Cmd);
    if (w!=0) return w;
    w = Compare(a.mu_Proc, b.mu_Proc);
    if (w!=0) return w;
    w = Compare(a.mu_Data, b.mu_Data);
    if (w!=0) return w;
  return 0;
}
  virtual void Permute(PermSet& Perm, int i);
  virtual void SimpleCanonicalize(PermSet& Perm);
  virtual void Canonicalize(PermSet& Perm);
  virtual void SimpleLimit(PermSet& Perm);
  virtual void ArrayLimit(PermSet& Perm);
  virtual void Limit(PermSet& Perm);
  virtual void MultisetLimit(PermSet& Perm);
  virtual void MultisetSort()
  {
    mu_Cmd.MultisetSort();
    mu_Proc.MultisetSort();
    mu_Data.MultisetSort();
  }
  void print_statistic()
  {
    mu_Cmd.print_statistic();
    mu_Proc.print_statistic();
    mu_Data.print_statistic();
  }
  void clear() {
    mu_Cmd.clear();
    mu_Proc.clear();
    mu_Data.clear();
 };
  void undefine() {
    mu_Cmd.undefine();
    mu_Proc.undefine();
    mu_Data.undefine();
 };
  void reset() {
    mu_Cmd.reset();
    mu_Proc.reset();
    mu_Data.reset();
 };
  void print() {
    mu_Cmd.print();
    mu_Proc.print();
    mu_Data.print();
  };
  void print_diff(state *prevstate) {
    mu_Cmd.print_diff(prevstate);
    mu_Proc.print_diff(prevstate);
    mu_Data.print_diff(prevstate);
  };
  void to_state(state *thestate) {
    mu_Cmd.to_state(thestate);
    mu_Proc.to_state(thestate);
    mu_Data.to_state(thestate);
  };
virtual bool isundefined() { Error.Error("Checking undefinedness of a non-base type"); return TRUE;}
virtual bool ismember() { Error.Error("Checking membership for a non-base type"); return TRUE;}
  mu_1_SHWB_MSG& operator= (const mu_1_SHWB_MSG& from) {
    mu_Cmd.value(from.mu_Cmd.value());
    mu_Proc.value(from.mu_Proc.value());
    mu_Data.value(from.mu_Data.value());
    return *this;
  };
};

  void mu_1_SHWB_MSG::set_self_ar( const char *n1, const char *n2, int os ) {
    if (n1 == NULL) {set_self(NULL, 0); return;}
    int l1 = strlen(n1), l2 = strlen(n2);
    strcpy( longname, n1 );
    longname[l1] = '[';
    strcpy( longname+l1+1, n2 );
    longname[l1+l2+1] = ']';
    longname[l1+l2+2] = 0;
    set_self( longname, os );
  };
  void mu_1_SHWB_MSG::set_self_2( const char *n1, const char *n2, int os ) {
    if (n1 == NULL) {set_self(NULL, 0); return;}
    strcpy( longname, n1 );
    strcat( longname, n2 );
    set_self( longname, os );
  };
void mu_1_SHWB_MSG::set_self(const char *n, int os)
{
  name = (char *)n;

  if (name) mu_Cmd.set_self_2(name, ".Cmd", os + 0 ); else mu_Cmd.set_self_2(NULL, NULL, 0);
  if (name) mu_Proc.set_self_2(name, ".Proc", os + 8 ); else mu_Proc.set_self_2(NULL, NULL, 0);
  if (name) mu_Data.set_self_2(name, ".Data", os + 16 ); else mu_Data.set_self_2(NULL, NULL, 0);
}

mu_1_SHWB_MSG::~mu_1_SHWB_MSG()
{
}

/*** end record declaration ***/
mu_1_SHWB_MSG mu_1_SHWB_MSG_undefined_var;

class mu_1_NAKC_CMD: public mu__byte
{
 public:
  inline int operator=(int val) { return value(val); };
  inline int operator=(const mu_1_NAKC_CMD& val) { return value(val.value()); };
  static const char *values[];
  friend ostream& operator<< (ostream& s, mu_1_NAKC_CMD& val)
  {
    if (val.defined())
      return ( s << mu_1_NAKC_CMD::values[ int(val) - 29] );
    else return ( s << "Undefined" );
  };

  mu_1_NAKC_CMD (const char *name, int os): mu__byte(29, 30, 2, name, os) {};
  mu_1_NAKC_CMD (void): mu__byte(29, 30, 2) {};
  mu_1_NAKC_CMD (int val): mu__byte(29, 30, 2, "Parameter or function result.", 0)
  {
     operator=(val);
  };
  const char * Name() { return values[ value() -29]; };
  virtual void Permute(PermSet& Perm, int i);
  virtual void SimpleCanonicalize(PermSet& Perm);
  virtual void Canonicalize(PermSet& Perm);
  virtual void SimpleLimit(PermSet& Perm);
  virtual void ArrayLimit(PermSet& Perm);
  virtual void Limit(PermSet& Perm);
  virtual void MultisetLimit(PermSet& Perm);
  virtual void MultisetSort() {};
  void print_statistic() {};
  virtual void print()
  {
    if (defined())
      cout << name << ":" << values[ value() -29] << '\n';
    else
      cout << name << ":Undefined\n";
  };
};

const char *mu_1_NAKC_CMD::values[] = {"NAKC_None","NAKC_Nakc",NULL };

/*** end of enum declaration ***/
mu_1_NAKC_CMD mu_1_NAKC_CMD_undefined_var;

class mu_1_NAKC_MSG
{
 public:
  char *name;
  char longname[BUFFER_SIZE/4];
  void set_self_2( const char *n, const char *n2, int os);
  void set_self_ar( const char *n, const char *n2, int os);
  void set_self(const char *n, int os);
  mu_1_NAKC_CMD mu_Cmd;
  mu_1_NAKC_MSG ( const char *n, int os ) { set_self(n,os); };
  mu_1_NAKC_MSG ( void ) {};

  virtual ~mu_1_NAKC_MSG(); 
friend int CompareWeight(mu_1_NAKC_MSG& a, mu_1_NAKC_MSG& b)
  {
    int w;
    w = CompareWeight(a.mu_Cmd, b.mu_Cmd);
    if (w!=0) return w;
  return 0;
}
friend int Compare(mu_1_NAKC_MSG& a, mu_1_NAKC_MSG& b)
  {
    int w;
    w = Compare(a.mu_Cmd, b.mu_Cmd);
    if (w!=0) return w;
  return 0;
}
  virtual void Permute(PermSet& Perm, int i);
  virtual void SimpleCanonicalize(PermSet& Perm);
  virtual void Canonicalize(PermSet& Perm);
  virtual void SimpleLimit(PermSet& Perm);
  virtual void ArrayLimit(PermSet& Perm);
  virtual void Limit(PermSet& Perm);
  virtual void MultisetLimit(PermSet& Perm);
  virtual void MultisetSort()
  {
    mu_Cmd.MultisetSort();
  }
  void print_statistic()
  {
    mu_Cmd.print_statistic();
  }
  void clear() {
    mu_Cmd.clear();
 };
  void undefine() {
    mu_Cmd.undefine();
 };
  void reset() {
    mu_Cmd.reset();
 };
  void print() {
    mu_Cmd.print();
  };
  void print_diff(state *prevstate) {
    mu_Cmd.print_diff(prevstate);
  };
  void to_state(state *thestate) {
    mu_Cmd.to_state(thestate);
  };
virtual bool isundefined() { Error.Error("Checking undefinedness of a non-base type"); return TRUE;}
virtual bool ismember() { Error.Error("Checking membership for a non-base type"); return TRUE;}
  mu_1_NAKC_MSG& operator= (const mu_1_NAKC_MSG& from) {
    mu_Cmd.value(from.mu_Cmd.value());
    return *this;
  };
};

  void mu_1_NAKC_MSG::set_self_ar( const char *n1, const char *n2, int os ) {
    if (n1 == NULL) {set_self(NULL, 0); return;}
    int l1 = strlen(n1), l2 = strlen(n2);
    strcpy( longname, n1 );
    longname[l1] = '[';
    strcpy( longname+l1+1, n2 );
    longname[l1+l2+1] = ']';
    longname[l1+l2+2] = 0;
    set_self( longname, os );
  };
  void mu_1_NAKC_MSG::set_self_2( const char *n1, const char *n2, int os ) {
    if (n1 == NULL) {set_self(NULL, 0); return;}
    strcpy( longname, n1 );
    strcat( longname, n2 );
    set_self( longname, os );
  };
void mu_1_NAKC_MSG::set_self(const char *n, int os)
{
  name = (char *)n;

  if (name) mu_Cmd.set_self_2(name, ".Cmd", os + 0 ); else mu_Cmd.set_self_2(NULL, NULL, 0);
}

mu_1_NAKC_MSG::~mu_1_NAKC_MSG()
{
}

/*** end record declaration ***/
mu_1_NAKC_MSG mu_1_NAKC_MSG_undefined_var;

class mu_1__type_2
{
 public:
  mu_1_NODE_STATE array[ 3 ];
 public:
  char *name;
  char longname[BUFFER_SIZE/4];
  void set_self( const char *n, int os);
  void set_self_2( const char *n, const char *n2, int os);
  void set_self_ar( const char *n, const char *n2, int os);
  mu_1__type_2 (const char *n, int os) { set_self(n, os); };
  mu_1__type_2 ( void ) {};
  virtual ~mu_1__type_2 ();
  mu_1_NODE_STATE& operator[] (int index) /* const */
  {
#ifndef NO_RUN_TIME_CHECKING
    if ( ( index >= 1 ) && ( index <= 3 ) )
      return array[ index - 1 ];
    else
      {
	if (index==UNDEFVAL) 
	  Error.Error("Indexing to %s using an undefined value.", name);
	else
	  Error.Error("Funny index value %d for %s: NODE is internally represented from 3 to 1.\nInternal Error in Type checking.",index, name);
	return array[0];
      }
#else
    return array[ index - 1 ];
#endif
  };
  mu_1__type_2& operator= (const mu_1__type_2& from)
  {
    for (int i = 0; i < 3; i++)
      array[i] = from.array[i];
    return *this;
  }

friend int CompareWeight(mu_1__type_2& a, mu_1__type_2& b)
  {
    return 0;
  }
friend int Compare(mu_1__type_2& a, mu_1__type_2& b)
  {
    int w;
    for (int i=0; i<3; i++) {
      w = Compare(a.array[i], b.array[i]);
      if (w!=0) return w;
    }
    return 0;
  }
  virtual void Permute(PermSet& Perm, int i);
  virtual void SimpleCanonicalize(PermSet& Perm);
  virtual void Canonicalize(PermSet& Perm);
  virtual void SimpleLimit(PermSet& Perm);
  virtual void ArrayLimit(PermSet& Perm);
  virtual void Limit(PermSet& Perm);
  virtual void MultisetLimit(PermSet& Perm);
  virtual void MultisetSort()
  {
    for (int i=0; i<3; i++)
      array[i].MultisetSort();
  }
  void print_statistic()
  {
    for (int i=0; i<3; i++)
      array[i].print_statistic();
  }
  void clear() { for (int i = 0; i < 3; i++) array[i].clear(); };

  void undefine() { for (int i = 0; i < 3; i++) array[i].undefine(); };

  void reset() { for (int i = 0; i < 3; i++) array[i].reset(); };

  void to_state(state *thestate)
  {
    for (int i = 0; i < 3; i++)
      array[i].to_state(thestate);
  };

  void print()
  {
    for (int i = 0; i < 3; i++)
      array[i].print(); };

  void print_diff(state *prevstate)
  {
    for (int i = 0; i < 3; i++)
      array[i].print_diff(prevstate);
  };
};

  void mu_1__type_2::set_self_ar( const char *n1, const char *n2, int os ) {
    if (n1 == NULL) {set_self(NULL, 0); return;}
    int l1 = strlen(n1), l2 = strlen(n2);
    strcpy( longname, n1 );
    longname[l1] = '[';
    strcpy( longname+l1+1, n2 );
    longname[l1+l2+1] = ']';
    longname[l1+l2+2] = 0;
    set_self( longname, os );
  };
  void mu_1__type_2::set_self_2( const char *n1, const char *n2, int os ) {
    if (n1 == NULL) {set_self(NULL, 0); return;}
    strcpy( longname, n1 );
    strcat( longname, n2 );
    set_self( longname, os );
  };
void mu_1__type_2::set_self( const char *n, int os)
  {
    int i=0;
    name = (char *)n;

if (n) array[i].set_self_ar(n,"NODE_1", i * 32 + os); else array[i].set_self_ar(NULL, NULL, 0); i++;
if (n) array[i].set_self_ar(n,"NODE_2", i * 32 + os); else array[i].set_self_ar(NULL, NULL, 0); i++;
if (n) array[i].set_self_ar(n,"NODE_3", i * 32 + os); else array[i].set_self_ar(NULL, NULL, 0); i++;
}
mu_1__type_2::~mu_1__type_2()
{
}
/*** end array declaration ***/
mu_1__type_2 mu_1__type_2_undefined_var;

class mu_1__type_3
{
 public:
  mu_1_UNI_MSG array[ 3 ];
 public:
  char *name;
  char longname[BUFFER_SIZE/4];
  void set_self( const char *n, int os);
  void set_self_2( const char *n, const char *n2, int os);
  void set_self_ar( const char *n, const char *n2, int os);
  mu_1__type_3 (const char *n, int os) { set_self(n, os); };
  mu_1__type_3 ( void ) {};
  virtual ~mu_1__type_3 ();
  mu_1_UNI_MSG& operator[] (int index) /* const */
  {
#ifndef NO_RUN_TIME_CHECKING
    if ( ( index >= 1 ) && ( index <= 3 ) )
      return array[ index - 1 ];
    else
      {
	if (index==UNDEFVAL) 
	  Error.Error("Indexing to %s using an undefined value.", name);
	else
	  Error.Error("Funny index value %d for %s: NODE is internally represented from 3 to 1.\nInternal Error in Type checking.",index, name);
	return array[0];
      }
#else
    return array[ index - 1 ];
#endif
  };
  mu_1__type_3& operator= (const mu_1__type_3& from)
  {
    for (int i = 0; i < 3; i++)
      array[i] = from.array[i];
    return *this;
  }

friend int CompareWeight(mu_1__type_3& a, mu_1__type_3& b)
  {
    return 0;
  }
friend int Compare(mu_1__type_3& a, mu_1__type_3& b)
  {
    int w;
    for (int i=0; i<3; i++) {
      w = Compare(a.array[i], b.array[i]);
      if (w!=0) return w;
    }
    return 0;
  }
  virtual void Permute(PermSet& Perm, int i);
  virtual void SimpleCanonicalize(PermSet& Perm);
  virtual void Canonicalize(PermSet& Perm);
  virtual void SimpleLimit(PermSet& Perm);
  virtual void ArrayLimit(PermSet& Perm);
  virtual void Limit(PermSet& Perm);
  virtual void MultisetLimit(PermSet& Perm);
  virtual void MultisetSort()
  {
    for (int i=0; i<3; i++)
      array[i].MultisetSort();
  }
  void print_statistic()
  {
    for (int i=0; i<3; i++)
      array[i].print_statistic();
  }
  void clear() { for (int i = 0; i < 3; i++) array[i].clear(); };

  void undefine() { for (int i = 0; i < 3; i++) array[i].undefine(); };

  void reset() { for (int i = 0; i < 3; i++) array[i].reset(); };

  void to_state(state *thestate)
  {
    for (int i = 0; i < 3; i++)
      array[i].to_state(thestate);
  };

  void print()
  {
    for (int i = 0; i < 3; i++)
      array[i].print(); };

  void print_diff(state *prevstate)
  {
    for (int i = 0; i < 3; i++)
      array[i].print_diff(prevstate);
  };
};

  void mu_1__type_3::set_self_ar( const char *n1, const char *n2, int os ) {
    if (n1 == NULL) {set_self(NULL, 0); return;}
    int l1 = strlen(n1), l2 = strlen(n2);
    strcpy( longname, n1 );
    longname[l1] = '[';
    strcpy( longname+l1+1, n2 );
    longname[l1+l2+1] = ']';
    longname[l1+l2+2] = 0;
    set_self( longname, os );
  };
  void mu_1__type_3::set_self_2( const char *n1, const char *n2, int os ) {
    if (n1 == NULL) {set_self(NULL, 0); return;}
    strcpy( longname, n1 );
    strcat( longname, n2 );
    set_self( longname, os );
  };
void mu_1__type_3::set_self( const char *n, int os)
  {
    int i=0;
    name = (char *)n;

if (n) array[i].set_self_ar(n,"NODE_1", i * 24 + os); else array[i].set_self_ar(NULL, NULL, 0); i++;
if (n) array[i].set_self_ar(n,"NODE_2", i * 24 + os); else array[i].set_self_ar(NULL, NULL, 0); i++;
if (n) array[i].set_self_ar(n,"NODE_3", i * 24 + os); else array[i].set_self_ar(NULL, NULL, 0); i++;
}
mu_1__type_3::~mu_1__type_3()
{
}
/*** end array declaration ***/
mu_1__type_3 mu_1__type_3_undefined_var;

class mu_1__type_4
{
 public:
  mu_1_INV_MSG array[ 3 ];
 public:
  char *name;
  char longname[BUFFER_SIZE/4];
  void set_self( const char *n, int os);
  void set_self_2( const char *n, const char *n2, int os);
  void set_self_ar( const char *n, const char *n2, int os);
  mu_1__type_4 (const char *n, int os) { set_self(n, os); };
  mu_1__type_4 ( void ) {};
  virtual ~mu_1__type_4 ();
  mu_1_INV_MSG& operator[] (int index) /* const */
  {
#ifndef NO_RUN_TIME_CHECKING
    if ( ( index >= 1 ) && ( index <= 3 ) )
      return array[ index - 1 ];
    else
      {
	if (index==UNDEFVAL) 
	  Error.Error("Indexing to %s using an undefined value.", name);
	else
	  Error.Error("Funny index value %d for %s: NODE is internally represented from 3 to 1.\nInternal Error in Type checking.",index, name);
	return array[0];
      }
#else
    return array[ index - 1 ];
#endif
  };
  mu_1__type_4& operator= (const mu_1__type_4& from)
  {
    for (int i = 0; i < 3; i++)
      array[i] = from.array[i];
    return *this;
  }

friend int CompareWeight(mu_1__type_4& a, mu_1__type_4& b)
  {
    return 0;
  }
friend int Compare(mu_1__type_4& a, mu_1__type_4& b)
  {
    int w;
    for (int i=0; i<3; i++) {
      w = Compare(a.array[i], b.array[i]);
      if (w!=0) return w;
    }
    return 0;
  }
  virtual void Permute(PermSet& Perm, int i);
  virtual void SimpleCanonicalize(PermSet& Perm);
  virtual void Canonicalize(PermSet& Perm);
  virtual void SimpleLimit(PermSet& Perm);
  virtual void ArrayLimit(PermSet& Perm);
  virtual void Limit(PermSet& Perm);
  virtual void MultisetLimit(PermSet& Perm);
  virtual void MultisetSort()
  {
    for (int i=0; i<3; i++)
      array[i].MultisetSort();
  }
  void print_statistic()
  {
    for (int i=0; i<3; i++)
      array[i].print_statistic();
  }
  void clear() { for (int i = 0; i < 3; i++) array[i].clear(); };

  void undefine() { for (int i = 0; i < 3; i++) array[i].undefine(); };

  void reset() { for (int i = 0; i < 3; i++) array[i].reset(); };

  void to_state(state *thestate)
  {
    for (int i = 0; i < 3; i++)
      array[i].to_state(thestate);
  };

  void print()
  {
    for (int i = 0; i < 3; i++)
      array[i].print(); };

  void print_diff(state *prevstate)
  {
    for (int i = 0; i < 3; i++)
      array[i].print_diff(prevstate);
  };
};

  void mu_1__type_4::set_self_ar( const char *n1, const char *n2, int os ) {
    if (n1 == NULL) {set_self(NULL, 0); return;}
    int l1 = strlen(n1), l2 = strlen(n2);
    strcpy( longname, n1 );
    longname[l1] = '[';
    strcpy( longname+l1+1, n2 );
    longname[l1+l2+1] = ']';
    longname[l1+l2+2] = 0;
    set_self( longname, os );
  };
  void mu_1__type_4::set_self_2( const char *n1, const char *n2, int os ) {
    if (n1 == NULL) {set_self(NULL, 0); return;}
    strcpy( longname, n1 );
    strcat( longname, n2 );
    set_self( longname, os );
  };
void mu_1__type_4::set_self( const char *n, int os)
  {
    int i=0;
    name = (char *)n;

if (n) array[i].set_self_ar(n,"NODE_1", i * 8 + os); else array[i].set_self_ar(NULL, NULL, 0); i++;
if (n) array[i].set_self_ar(n,"NODE_2", i * 8 + os); else array[i].set_self_ar(NULL, NULL, 0); i++;
if (n) array[i].set_self_ar(n,"NODE_3", i * 8 + os); else array[i].set_self_ar(NULL, NULL, 0); i++;
}
mu_1__type_4::~mu_1__type_4()
{
}
/*** end array declaration ***/
mu_1__type_4 mu_1__type_4_undefined_var;

class mu_1__type_5
{
 public:
  mu_1_RP_MSG array[ 3 ];
 public:
  char *name;
  char longname[BUFFER_SIZE/4];
  void set_self( const char *n, int os);
  void set_self_2( const char *n, const char *n2, int os);
  void set_self_ar( const char *n, const char *n2, int os);
  mu_1__type_5 (const char *n, int os) { set_self(n, os); };
  mu_1__type_5 ( void ) {};
  virtual ~mu_1__type_5 ();
  mu_1_RP_MSG& operator[] (int index) /* const */
  {
#ifndef NO_RUN_TIME_CHECKING
    if ( ( index >= 1 ) && ( index <= 3 ) )
      return array[ index - 1 ];
    else
      {
	if (index==UNDEFVAL) 
	  Error.Error("Indexing to %s using an undefined value.", name);
	else
	  Error.Error("Funny index value %d for %s: NODE is internally represented from 3 to 1.\nInternal Error in Type checking.",index, name);
	return array[0];
      }
#else
    return array[ index - 1 ];
#endif
  };
  mu_1__type_5& operator= (const mu_1__type_5& from)
  {
    for (int i = 0; i < 3; i++)
      array[i] = from.array[i];
    return *this;
  }

friend int CompareWeight(mu_1__type_5& a, mu_1__type_5& b)
  {
    return 0;
  }
friend int Compare(mu_1__type_5& a, mu_1__type_5& b)
  {
    int w;
    for (int i=0; i<3; i++) {
      w = Compare(a.array[i], b.array[i]);
      if (w!=0) return w;
    }
    return 0;
  }
  virtual void Permute(PermSet& Perm, int i);
  virtual void SimpleCanonicalize(PermSet& Perm);
  virtual void Canonicalize(PermSet& Perm);
  virtual void SimpleLimit(PermSet& Perm);
  virtual void ArrayLimit(PermSet& Perm);
  virtual void Limit(PermSet& Perm);
  virtual void MultisetLimit(PermSet& Perm);
  virtual void MultisetSort()
  {
    for (int i=0; i<3; i++)
      array[i].MultisetSort();
  }
  void print_statistic()
  {
    for (int i=0; i<3; i++)
      array[i].print_statistic();
  }
  void clear() { for (int i = 0; i < 3; i++) array[i].clear(); };

  void undefine() { for (int i = 0; i < 3; i++) array[i].undefine(); };

  void reset() { for (int i = 0; i < 3; i++) array[i].reset(); };

  void to_state(state *thestate)
  {
    for (int i = 0; i < 3; i++)
      array[i].to_state(thestate);
  };

  void print()
  {
    for (int i = 0; i < 3; i++)
      array[i].print(); };

  void print_diff(state *prevstate)
  {
    for (int i = 0; i < 3; i++)
      array[i].print_diff(prevstate);
  };
};

  void mu_1__type_5::set_self_ar( const char *n1, const char *n2, int os ) {
    if (n1 == NULL) {set_self(NULL, 0); return;}
    int l1 = strlen(n1), l2 = strlen(n2);
    strcpy( longname, n1 );
    longname[l1] = '[';
    strcpy( longname+l1+1, n2 );
    longname[l1+l2+1] = ']';
    longname[l1+l2+2] = 0;
    set_self( longname, os );
  };
  void mu_1__type_5::set_self_2( const char *n1, const char *n2, int os ) {
    if (n1 == NULL) {set_self(NULL, 0); return;}
    strcpy( longname, n1 );
    strcat( longname, n2 );
    set_self( longname, os );
  };
void mu_1__type_5::set_self( const char *n, int os)
  {
    int i=0;
    name = (char *)n;

if (n) array[i].set_self_ar(n,"NODE_1", i * 8 + os); else array[i].set_self_ar(NULL, NULL, 0); i++;
if (n) array[i].set_self_ar(n,"NODE_2", i * 8 + os); else array[i].set_self_ar(NULL, NULL, 0); i++;
if (n) array[i].set_self_ar(n,"NODE_3", i * 8 + os); else array[i].set_self_ar(NULL, NULL, 0); i++;
}
mu_1__type_5::~mu_1__type_5()
{
}
/*** end array declaration ***/
mu_1__type_5 mu_1__type_5_undefined_var;

class mu_1_STATE
{
 public:
  char *name;
  char longname[BUFFER_SIZE/4];
  void set_self_2( const char *n, const char *n2, int os);
  void set_self_ar( const char *n, const char *n2, int os);
  void set_self(const char *n, int os);
  mu_1__type_2 mu_Proc;
  mu_1_DIR_STATE mu_Dir;
  mu_1_DATA mu_MemData;
  mu_1__type_3 mu_UniMsg;
  mu_1__type_4 mu_InvMsg;
  mu_1__type_5 mu_RpMsg;
  mu_1_WB_MSG mu_WbMsg;
  mu_1_SHWB_MSG mu_ShWbMsg;
  mu_1_NAKC_MSG mu_NakcMsg;
  mu_1_DATA mu_CurrData;
  mu_1_DATA mu_PrevData;
  mu_0_boolean mu_LastWrVld;
  mu_1_ABS_NODE mu_LastWrPtr;
  mu_1_ABS_NODE mu_PendReqSrc;
  mu_1_UNI_CMD mu_PendReqCmd;
  mu_0_boolean mu_Collecting;
  mu_1_UNI_CMD mu_FwdCmd;
  mu_1_ABS_NODE mu_FwdSrc;
  mu_1_ABS_NODE mu_LastInvAck;
  mu_1_ABS_NODE mu_LastOtherInvAck;
  mu_1_STATE ( const char *n, int os ) { set_self(n,os); };
  mu_1_STATE ( void ) {};

  virtual ~mu_1_STATE(); 
friend int CompareWeight(mu_1_STATE& a, mu_1_STATE& b)
  {
    int w;
    w = CompareWeight(a.mu_Proc, b.mu_Proc);
    if (w!=0) return w;
    w = CompareWeight(a.mu_Dir, b.mu_Dir);
    if (w!=0) return w;
    w = CompareWeight(a.mu_MemData, b.mu_MemData);
    if (w!=0) return w;
    w = CompareWeight(a.mu_UniMsg, b.mu_UniMsg);
    if (w!=0) return w;
    w = CompareWeight(a.mu_InvMsg, b.mu_InvMsg);
    if (w!=0) return w;
    w = CompareWeight(a.mu_RpMsg, b.mu_RpMsg);
    if (w!=0) return w;
    w = CompareWeight(a.mu_WbMsg, b.mu_WbMsg);
    if (w!=0) return w;
    w = CompareWeight(a.mu_ShWbMsg, b.mu_ShWbMsg);
    if (w!=0) return w;
    w = CompareWeight(a.mu_NakcMsg, b.mu_NakcMsg);
    if (w!=0) return w;
    w = CompareWeight(a.mu_CurrData, b.mu_CurrData);
    if (w!=0) return w;
    w = CompareWeight(a.mu_PrevData, b.mu_PrevData);
    if (w!=0) return w;
    w = CompareWeight(a.mu_LastWrVld, b.mu_LastWrVld);
    if (w!=0) return w;
    w = CompareWeight(a.mu_LastWrPtr, b.mu_LastWrPtr);
    if (w!=0) return w;
    w = CompareWeight(a.mu_PendReqSrc, b.mu_PendReqSrc);
    if (w!=0) return w;
    w = CompareWeight(a.mu_PendReqCmd, b.mu_PendReqCmd);
    if (w!=0) return w;
    w = CompareWeight(a.mu_Collecting, b.mu_Collecting);
    if (w!=0) return w;
    w = CompareWeight(a.mu_FwdCmd, b.mu_FwdCmd);
    if (w!=0) return w;
    w = CompareWeight(a.mu_FwdSrc, b.mu_FwdSrc);
    if (w!=0) return w;
    w = CompareWeight(a.mu_LastInvAck, b.mu_LastInvAck);
    if (w!=0) return w;
    w = CompareWeight(a.mu_LastOtherInvAck, b.mu_LastOtherInvAck);
    if (w!=0) return w;
  return 0;
}
friend int Compare(mu_1_STATE& a, mu_1_STATE& b)
  {
    int w;
    w = Compare(a.mu_Proc, b.mu_Proc);
    if (w!=0) return w;
    w = Compare(a.mu_Dir, b.mu_Dir);
    if (w!=0) return w;
    w = Compare(a.mu_MemData, b.mu_MemData);
    if (w!=0) return w;
    w = Compare(a.mu_UniMsg, b.mu_UniMsg);
    if (w!=0) return w;
    w = Compare(a.mu_InvMsg, b.mu_InvMsg);
    if (w!=0) return w;
    w = Compare(a.mu_RpMsg, b.mu_RpMsg);
    if (w!=0) return w;
    w = Compare(a.mu_WbMsg, b.mu_WbMsg);
    if (w!=0) return w;
    w = Compare(a.mu_ShWbMsg, b.mu_ShWbMsg);
    if (w!=0) return w;
    w = Compare(a.mu_NakcMsg, b.mu_NakcMsg);
    if (w!=0) return w;
    w = Compare(a.mu_CurrData, b.mu_CurrData);
    if (w!=0) return w;
    w = Compare(a.mu_PrevData, b.mu_PrevData);
    if (w!=0) return w;
    w = Compare(a.mu_LastWrVld, b.mu_LastWrVld);
    if (w!=0) return w;
    w = Compare(a.mu_LastWrPtr, b.mu_LastWrPtr);
    if (w!=0) return w;
    w = Compare(a.mu_PendReqSrc, b.mu_PendReqSrc);
    if (w!=0) return w;
    w = Compare(a.mu_PendReqCmd, b.mu_PendReqCmd);
    if (w!=0) return w;
    w = Compare(a.mu_Collecting, b.mu_Collecting);
    if (w!=0) return w;
    w = Compare(a.mu_FwdCmd, b.mu_FwdCmd);
    if (w!=0) return w;
    w = Compare(a.mu_FwdSrc, b.mu_FwdSrc);
    if (w!=0) return w;
    w = Compare(a.mu_LastInvAck, b.mu_LastInvAck);
    if (w!=0) return w;
    w = Compare(a.mu_LastOtherInvAck, b.mu_LastOtherInvAck);
    if (w!=0) return w;
  return 0;
}
  virtual void Permute(PermSet& Perm, int i);
  virtual void SimpleCanonicalize(PermSet& Perm);
  virtual void Canonicalize(PermSet& Perm);
  virtual void SimpleLimit(PermSet& Perm);
  virtual void ArrayLimit(PermSet& Perm);
  virtual void Limit(PermSet& Perm);
  virtual void MultisetLimit(PermSet& Perm);
  virtual void MultisetSort()
  {
    mu_Proc.MultisetSort();
    mu_Dir.MultisetSort();
    mu_MemData.MultisetSort();
    mu_UniMsg.MultisetSort();
    mu_InvMsg.MultisetSort();
    mu_RpMsg.MultisetSort();
    mu_WbMsg.MultisetSort();
    mu_ShWbMsg.MultisetSort();
    mu_NakcMsg.MultisetSort();
    mu_CurrData.MultisetSort();
    mu_PrevData.MultisetSort();
    mu_LastWrVld.MultisetSort();
    mu_LastWrPtr.MultisetSort();
    mu_PendReqSrc.MultisetSort();
    mu_PendReqCmd.MultisetSort();
    mu_Collecting.MultisetSort();
    mu_FwdCmd.MultisetSort();
    mu_FwdSrc.MultisetSort();
    mu_LastInvAck.MultisetSort();
    mu_LastOtherInvAck.MultisetSort();
  }
  void print_statistic()
  {
    mu_Proc.print_statistic();
    mu_Dir.print_statistic();
    mu_MemData.print_statistic();
    mu_UniMsg.print_statistic();
    mu_InvMsg.print_statistic();
    mu_RpMsg.print_statistic();
    mu_WbMsg.print_statistic();
    mu_ShWbMsg.print_statistic();
    mu_NakcMsg.print_statistic();
    mu_CurrData.print_statistic();
    mu_PrevData.print_statistic();
    mu_LastWrVld.print_statistic();
    mu_LastWrPtr.print_statistic();
    mu_PendReqSrc.print_statistic();
    mu_PendReqCmd.print_statistic();
    mu_Collecting.print_statistic();
    mu_FwdCmd.print_statistic();
    mu_FwdSrc.print_statistic();
    mu_LastInvAck.print_statistic();
    mu_LastOtherInvAck.print_statistic();
  }
  void clear() {
    mu_Proc.clear();
    mu_Dir.clear();
    mu_MemData.clear();
    mu_UniMsg.clear();
    mu_InvMsg.clear();
    mu_RpMsg.clear();
    mu_WbMsg.clear();
    mu_ShWbMsg.clear();
    mu_NakcMsg.clear();
    mu_CurrData.clear();
    mu_PrevData.clear();
    mu_LastWrVld.clear();
    mu_LastWrPtr.clear();
    mu_PendReqSrc.clear();
    mu_PendReqCmd.clear();
    mu_Collecting.clear();
    mu_FwdCmd.clear();
    mu_FwdSrc.clear();
    mu_LastInvAck.clear();
    mu_LastOtherInvAck.clear();
 };
  void undefine() {
    mu_Proc.undefine();
    mu_Dir.undefine();
    mu_MemData.undefine();
    mu_UniMsg.undefine();
    mu_InvMsg.undefine();
    mu_RpMsg.undefine();
    mu_WbMsg.undefine();
    mu_ShWbMsg.undefine();
    mu_NakcMsg.undefine();
    mu_CurrData.undefine();
    mu_PrevData.undefine();
    mu_LastWrVld.undefine();
    mu_LastWrPtr.undefine();
    mu_PendReqSrc.undefine();
    mu_PendReqCmd.undefine();
    mu_Collecting.undefine();
    mu_FwdCmd.undefine();
    mu_FwdSrc.undefine();
    mu_LastInvAck.undefine();
    mu_LastOtherInvAck.undefine();
 };
  void reset() {
    mu_Proc.reset();
    mu_Dir.reset();
    mu_MemData.reset();
    mu_UniMsg.reset();
    mu_InvMsg.reset();
    mu_RpMsg.reset();
    mu_WbMsg.reset();
    mu_ShWbMsg.reset();
    mu_NakcMsg.reset();
    mu_CurrData.reset();
    mu_PrevData.reset();
    mu_LastWrVld.reset();
    mu_LastWrPtr.reset();
    mu_PendReqSrc.reset();
    mu_PendReqCmd.reset();
    mu_Collecting.reset();
    mu_FwdCmd.reset();
    mu_FwdSrc.reset();
    mu_LastInvAck.reset();
    mu_LastOtherInvAck.reset();
 };
  void print() {
    mu_Proc.print();
    mu_Dir.print();
    mu_MemData.print();
    mu_UniMsg.print();
    mu_InvMsg.print();
    mu_RpMsg.print();
    mu_WbMsg.print();
    mu_ShWbMsg.print();
    mu_NakcMsg.print();
    mu_CurrData.print();
    mu_PrevData.print();
    mu_LastWrVld.print();
    mu_LastWrPtr.print();
    mu_PendReqSrc.print();
    mu_PendReqCmd.print();
    mu_Collecting.print();
    mu_FwdCmd.print();
    mu_FwdSrc.print();
    mu_LastInvAck.print();
    mu_LastOtherInvAck.print();
  };
  void print_diff(state *prevstate) {
    mu_Proc.print_diff(prevstate);
    mu_Dir.print_diff(prevstate);
    mu_MemData.print_diff(prevstate);
    mu_UniMsg.print_diff(prevstate);
    mu_InvMsg.print_diff(prevstate);
    mu_RpMsg.print_diff(prevstate);
    mu_WbMsg.print_diff(prevstate);
    mu_ShWbMsg.print_diff(prevstate);
    mu_NakcMsg.print_diff(prevstate);
    mu_CurrData.print_diff(prevstate);
    mu_PrevData.print_diff(prevstate);
    mu_LastWrVld.print_diff(prevstate);
    mu_LastWrPtr.print_diff(prevstate);
    mu_PendReqSrc.print_diff(prevstate);
    mu_PendReqCmd.print_diff(prevstate);
    mu_Collecting.print_diff(prevstate);
    mu_FwdCmd.print_diff(prevstate);
    mu_FwdSrc.print_diff(prevstate);
    mu_LastInvAck.print_diff(prevstate);
    mu_LastOtherInvAck.print_diff(prevstate);
  };
  void to_state(state *thestate) {
    mu_Proc.to_state(thestate);
    mu_Dir.to_state(thestate);
    mu_MemData.to_state(thestate);
    mu_UniMsg.to_state(thestate);
    mu_InvMsg.to_state(thestate);
    mu_RpMsg.to_state(thestate);
    mu_WbMsg.to_state(thestate);
    mu_ShWbMsg.to_state(thestate);
    mu_NakcMsg.to_state(thestate);
    mu_CurrData.to_state(thestate);
    mu_PrevData.to_state(thestate);
    mu_LastWrVld.to_state(thestate);
    mu_LastWrPtr.to_state(thestate);
    mu_PendReqSrc.to_state(thestate);
    mu_PendReqCmd.to_state(thestate);
    mu_Collecting.to_state(thestate);
    mu_FwdCmd.to_state(thestate);
    mu_FwdSrc.to_state(thestate);
    mu_LastInvAck.to_state(thestate);
    mu_LastOtherInvAck.to_state(thestate);
  };
virtual bool isundefined() { Error.Error("Checking undefinedness of a non-base type"); return TRUE;}
virtual bool ismember() { Error.Error("Checking membership for a non-base type"); return TRUE;}
  mu_1_STATE& operator= (const mu_1_STATE& from) {
    mu_Proc = from.mu_Proc;
    mu_Dir = from.mu_Dir;
    mu_MemData.value(from.mu_MemData.value());
    mu_UniMsg = from.mu_UniMsg;
    mu_InvMsg = from.mu_InvMsg;
    mu_RpMsg = from.mu_RpMsg;
    mu_WbMsg = from.mu_WbMsg;
    mu_ShWbMsg = from.mu_ShWbMsg;
    mu_NakcMsg = from.mu_NakcMsg;
    mu_CurrData.value(from.mu_CurrData.value());
    mu_PrevData.value(from.mu_PrevData.value());
    mu_LastWrVld.value(from.mu_LastWrVld.value());
    mu_LastWrPtr.value(from.mu_LastWrPtr.value());
    mu_PendReqSrc.value(from.mu_PendReqSrc.value());
    mu_PendReqCmd.value(from.mu_PendReqCmd.value());
    mu_Collecting.value(from.mu_Collecting.value());
    mu_FwdCmd.value(from.mu_FwdCmd.value());
    mu_FwdSrc.value(from.mu_FwdSrc.value());
    mu_LastInvAck.value(from.mu_LastInvAck.value());
    mu_LastOtherInvAck.value(from.mu_LastOtherInvAck.value());
    return *this;
  };
};

  void mu_1_STATE::set_self_ar( const char *n1, const char *n2, int os ) {
    if (n1 == NULL) {set_self(NULL, 0); return;}
    int l1 = strlen(n1), l2 = strlen(n2);
    strcpy( longname, n1 );
    longname[l1] = '[';
    strcpy( longname+l1+1, n2 );
    longname[l1+l2+1] = ']';
    longname[l1+l2+2] = 0;
    set_self( longname, os );
  };
  void mu_1_STATE::set_self_2( const char *n1, const char *n2, int os ) {
    if (n1 == NULL) {set_self(NULL, 0); return;}
    strcpy( longname, n1 );
    strcat( longname, n2 );
    set_self( longname, os );
  };
void mu_1_STATE::set_self(const char *n, int os)
{
  name = (char *)n;

  if (name) mu_Proc.set_self_2(name, ".Proc", os + 0 ); else mu_Proc.set_self_2(NULL, NULL, 0);
  if (name) mu_Dir.set_self_2(name, ".Dir", os + 96 ); else mu_Dir.set_self_2(NULL, NULL, 0);
  if (name) mu_MemData.set_self_2(name, ".MemData", os + 192 ); else mu_MemData.set_self_2(NULL, NULL, 0);
  if (name) mu_UniMsg.set_self_2(name, ".UniMsg", os + 200 ); else mu_UniMsg.set_self_2(NULL, NULL, 0);
  if (name) mu_InvMsg.set_self_2(name, ".InvMsg", os + 272 ); else mu_InvMsg.set_self_2(NULL, NULL, 0);
  if (name) mu_RpMsg.set_self_2(name, ".RpMsg", os + 296 ); else mu_RpMsg.set_self_2(NULL, NULL, 0);
  if (name) mu_WbMsg.set_self_2(name, ".WbMsg", os + 320 ); else mu_WbMsg.set_self_2(NULL, NULL, 0);
  if (name) mu_ShWbMsg.set_self_2(name, ".ShWbMsg", os + 344 ); else mu_ShWbMsg.set_self_2(NULL, NULL, 0);
  if (name) mu_NakcMsg.set_self_2(name, ".NakcMsg", os + 368 ); else mu_NakcMsg.set_self_2(NULL, NULL, 0);
  if (name) mu_CurrData.set_self_2(name, ".CurrData", os + 376 ); else mu_CurrData.set_self_2(NULL, NULL, 0);
  if (name) mu_PrevData.set_self_2(name, ".PrevData", os + 384 ); else mu_PrevData.set_self_2(NULL, NULL, 0);
  if (name) mu_LastWrVld.set_self_2(name, ".LastWrVld", os + 392 ); else mu_LastWrVld.set_self_2(NULL, NULL, 0);
  if (name) mu_LastWrPtr.set_self_2(name, ".LastWrPtr", os + 400 ); else mu_LastWrPtr.set_self_2(NULL, NULL, 0);
  if (name) mu_PendReqSrc.set_self_2(name, ".PendReqSrc", os + 408 ); else mu_PendReqSrc.set_self_2(NULL, NULL, 0);
  if (name) mu_PendReqCmd.set_self_2(name, ".PendReqCmd", os + 416 ); else mu_PendReqCmd.set_self_2(NULL, NULL, 0);
  if (name) mu_Collecting.set_self_2(name, ".Collecting", os + 424 ); else mu_Collecting.set_self_2(NULL, NULL, 0);
  if (name) mu_FwdCmd.set_self_2(name, ".FwdCmd", os + 432 ); else mu_FwdCmd.set_self_2(NULL, NULL, 0);
  if (name) mu_FwdSrc.set_self_2(name, ".FwdSrc", os + 440 ); else mu_FwdSrc.set_self_2(NULL, NULL, 0);
  if (name) mu_LastInvAck.set_self_2(name, ".LastInvAck", os + 448 ); else mu_LastInvAck.set_self_2(NULL, NULL, 0);
  if (name) mu_LastOtherInvAck.set_self_2(name, ".LastOtherInvAck", os + 456 ); else mu_LastOtherInvAck.set_self_2(NULL, NULL, 0);
}

mu_1_STATE::~mu_1_STATE()
{
}

/*** end record declaration ***/
mu_1_STATE mu_1_STATE_undefined_var;

const int mu_NODE_NUM = 3;
const int mu_DATA_NUM = 2;
const int mu_NODE_1 = 1;
const int mu_NODE_2 = 2;
const int mu_NODE_3 = 3;
const int mu_DATA_1 = 4;
const int mu_DATA_2 = 5;
const int mu_Other = 6;
const int mu_CACHE_I = 7;
const int mu_CACHE_S = 8;
const int mu_CACHE_E = 9;
const int mu_NODE_None = 10;
const int mu_NODE_Get = 11;
const int mu_NODE_GetX = 12;
const int mu_UNI_None = 13;
const int mu_UNI_Get = 14;
const int mu_UNI_GetX = 15;
const int mu_UNI_Put = 16;
const int mu_UNI_PutX = 17;
const int mu_UNI_Nak = 18;
const int mu_INV_None = 19;
const int mu_INV_Inv = 20;
const int mu_INV_InvAck = 21;
const int mu_RP_None = 22;
const int mu_RP_Replace = 23;
const int mu_WB_None = 24;
const int mu_WB_Wb = 25;
const int mu_SHWB_None = 26;
const int mu_SHWB_ShWb = 27;
const int mu_SHWB_FAck = 28;
const int mu_NAKC_None = 29;
const int mu_NAKC_Nakc = 30;
/*** Variable declaration ***/
mu_1_NODE mu_Home("Home",0);

/*** Variable declaration ***/
mu_1_STATE mu_Sta("Sta",8);





/********************
  The world
 ********************/
void world_class::clear()
{
  mu_Home.clear();
  mu_Sta.clear();
}
void world_class::undefine()
{
  mu_Home.undefine();
  mu_Sta.undefine();
}
void world_class::reset()
{
  mu_Home.reset();
  mu_Sta.reset();
}
void world_class::print()
{
  static int num_calls = 0; /* to ward off recursive calls. */
  if ( num_calls == 0 ) {
    num_calls++;
  mu_Home.print();
  mu_Sta.print();
    num_calls--;
}
}
void world_class::print_statistic()
{
  static int num_calls = 0; /* to ward off recursive calls. */
  if ( num_calls == 0 ) {
    num_calls++;
  mu_Home.print_statistic();
  mu_Sta.print_statistic();
    num_calls--;
}
}
void world_class::print_diff( state *prevstate )
{
  if ( prevstate != NULL )
  {
    mu_Home.print_diff(prevstate);
    mu_Sta.print_diff(prevstate);
  }
  else
print();
}
void world_class::to_state(state *newstate)
{
  mu_Home.to_state( newstate );
  mu_Sta.to_state( newstate );
}
void world_class::setstate(state *thestate)
{
}


/********************
  Rule declarations
 ********************/
/******************** RuleBase0 ********************/
class RuleBase0
{
public:
  int Priority()
  {
    return 0;
  }
  char * Name(unsigned r)
  {
    static mu_1_NODE mu_src;
    mu_src.value((r % 3) + 1);
    r = r / 3;
    return tsprintf("NI_Replace, src:%s", mu_src.Name());
  }
  bool Condition(unsigned r)
  {
    static mu_1_NODE mu_src;
    mu_src.value((r % 3) + 1);
    r = r / 3;
    return (mu_Sta.mu_RpMsg[mu_src].mu_Cmd) == (mu_RP_Replace);
  }

  void NextRule(unsigned & what_rule)
  {
    unsigned r = what_rule - 0;
    static mu_1_NODE mu_src;
    mu_src.value((r % 3) + 1);
    r = r / 3;
    while (what_rule < 3 )
      {
	if ( ( TRUE  ) ) {
	      if ((mu_Sta.mu_RpMsg[mu_src].mu_Cmd) == (mu_RP_Replace)) {
		if ( ( TRUE  ) )
		  return;
		else
		  what_rule++;
	      }
	      else
		what_rule += 1;
	}
	else
	  what_rule += 1;
    r = what_rule - 0;
    mu_src.value((r % 3) + 1);
    r = r / 3;
    }
  }

  void Code(unsigned r)
  {
    static mu_1_NODE mu_src;
    mu_src.value((r % 3) + 1);
    r = r / 3;
/*** Variable declaration ***/
mu_1_STATE mu_NxtSta("NxtSta",0);

mu_NxtSta = mu_Sta;
mu_NxtSta.mu_RpMsg[mu_src].mu_Cmd = mu_RP_None;
if ( mu_Sta.mu_Dir.mu_ShrVld )
{
mu_NxtSta.mu_Dir.mu_ShrSet[mu_src] = mu_false;
mu_NxtSta.mu_Dir.mu_InvSet[mu_src] = mu_false;
}
mu_Sta = mu_NxtSta;
  };

};
/******************** RuleBase1 ********************/
class RuleBase1
{
public:
  int Priority()
  {
    return 0;
  }
  char * Name(unsigned r)
  {
    return tsprintf("NI_ShWb");
  }
  bool Condition(unsigned r)
  {
    return (mu_Sta.mu_ShWbMsg.mu_Cmd) == (mu_SHWB_ShWb);
  }

  void NextRule(unsigned & what_rule)
  {
    unsigned r = what_rule - 3;
    while (what_rule < 4 )
      {
	if ( ( TRUE  ) ) {
	      if ((mu_Sta.mu_ShWbMsg.mu_Cmd) == (mu_SHWB_ShWb)) {
		if ( ( TRUE  ) )
		  return;
		else
		  what_rule++;
	      }
	      else
		what_rule += 1;
	}
	else
	  what_rule += 1;
    r = what_rule - 3;
    }
  }

  void Code(unsigned r)
  {
/*** Variable declaration ***/
mu_1_STATE mu_NxtSta("NxtSta",0);

mu_NxtSta = mu_Sta;
mu_NxtSta.mu_ShWbMsg.mu_Cmd = mu_SHWB_None;
mu_NxtSta.mu_ShWbMsg.mu_Proc.undefine();
mu_NxtSta.mu_ShWbMsg.mu_Data.undefine();
mu_NxtSta.mu_Dir.mu_Pending = mu_false;
mu_NxtSta.mu_Dir.mu_Dirty = mu_false;
mu_NxtSta.mu_Dir.mu_ShrVld = mu_true;
{
for(int mu_p = 1; mu_p <= 3; mu_p++) {
bool mu__boolexpr6;
  if ((mu_p) == (mu_Sta.mu_ShWbMsg.mu_Proc)) mu__boolexpr6 = TRUE ;
  else {
  mu__boolexpr6 = (mu_Sta.mu_Dir.mu_ShrSet[mu_p]) ; 
}
mu_NxtSta.mu_Dir.mu_ShrSet[mu_p] = mu__boolexpr6;
bool mu__boolexpr7;
  if ((mu_p) == (mu_Sta.mu_ShWbMsg.mu_Proc)) mu__boolexpr7 = TRUE ;
  else {
  mu__boolexpr7 = (mu_Sta.mu_Dir.mu_ShrSet[mu_p]) ; 
}
mu_NxtSta.mu_Dir.mu_InvSet[mu_p] = mu__boolexpr7;
};
};
mu_NxtSta.mu_MemData = mu_Sta.mu_ShWbMsg.mu_Data;
mu_Sta = mu_NxtSta;
  };

};
/******************** RuleBase2 ********************/
class RuleBase2
{
public:
  int Priority()
  {
    return 0;
  }
  char * Name(unsigned r)
  {
    return tsprintf("NI_FAck");
  }
  bool Condition(unsigned r)
  {
    return (mu_Sta.mu_ShWbMsg.mu_Cmd) == (mu_SHWB_FAck);
  }

  void NextRule(unsigned & what_rule)
  {
    unsigned r = what_rule - 4;
    while (what_rule < 5 )
      {
	if ( ( TRUE  ) ) {
	      if ((mu_Sta.mu_ShWbMsg.mu_Cmd) == (mu_SHWB_FAck)) {
		if ( ( TRUE  ) )
		  return;
		else
		  what_rule++;
	      }
	      else
		what_rule += 1;
	}
	else
	  what_rule += 1;
    r = what_rule - 4;
    }
  }

  void Code(unsigned r)
  {
/*** Variable declaration ***/
mu_1_STATE mu_NxtSta("NxtSta",0);

mu_NxtSta = mu_Sta;
mu_NxtSta.mu_ShWbMsg.mu_Cmd = mu_SHWB_None;
mu_NxtSta.mu_ShWbMsg.mu_Proc.undefine();
mu_NxtSta.mu_ShWbMsg.mu_Data.undefine();
mu_NxtSta.mu_Dir.mu_Pending = mu_false;
if ( mu_Sta.mu_Dir.mu_Dirty )
{
mu_NxtSta.mu_Dir.mu_HeadPtr = mu_Sta.mu_ShWbMsg.mu_Proc;
}
mu_Sta = mu_NxtSta;
  };

};
/******************** RuleBase3 ********************/
class RuleBase3
{
public:
  int Priority()
  {
    return 0;
  }
  char * Name(unsigned r)
  {
    return tsprintf("NI_Wb");
  }
  bool Condition(unsigned r)
  {
    return (mu_Sta.mu_WbMsg.mu_Cmd) == (mu_WB_Wb);
  }

  void NextRule(unsigned & what_rule)
  {
    unsigned r = what_rule - 5;
    while (what_rule < 6 )
      {
	if ( ( TRUE  ) ) {
	      if ((mu_Sta.mu_WbMsg.mu_Cmd) == (mu_WB_Wb)) {
		if ( ( TRUE  ) )
		  return;
		else
		  what_rule++;
	      }
	      else
		what_rule += 1;
	}
	else
	  what_rule += 1;
    r = what_rule - 5;
    }
  }

  void Code(unsigned r)
  {
/*** Variable declaration ***/
mu_1_STATE mu_NxtSta("NxtSta",0);

mu_NxtSta = mu_Sta;
mu_NxtSta.mu_WbMsg.mu_Cmd = mu_WB_None;
mu_NxtSta.mu_WbMsg.mu_Proc.undefine();
mu_NxtSta.mu_WbMsg.mu_Data.undefine();
mu_NxtSta.mu_Dir.mu_Dirty = mu_false;
mu_NxtSta.mu_Dir.mu_HeadVld = mu_false;
mu_NxtSta.mu_Dir.mu_HeadPtr.undefine();
mu_NxtSta.mu_MemData = mu_Sta.mu_WbMsg.mu_Data;
mu_Sta = mu_NxtSta;
  };

};
/******************** RuleBase4 ********************/
class RuleBase4
{
public:
  int Priority()
  {
    return 0;
  }
  char * Name(unsigned r)
  {
    static mu_1_NODE mu_src;
    mu_src.value((r % 3) + 1);
    r = r / 3;
    return tsprintf("NI_InvAck, src:%s", mu_src.Name());
  }
  bool Condition(unsigned r)
  {
    static mu_1_NODE mu_src;
    mu_src.value((r % 3) + 1);
    r = r / 3;
bool mu__boolexpr8;
bool mu__boolexpr9;
bool mu__boolexpr10;
  if (!((mu_src) != (mu_Home))) mu__boolexpr10 = FALSE ;
  else {
  mu__boolexpr10 = ((mu_Sta.mu_InvMsg[mu_src].mu_Cmd) == (mu_INV_InvAck)) ; 
}
  if (!(mu__boolexpr10)) mu__boolexpr9 = FALSE ;
  else {
  mu__boolexpr9 = (mu_Sta.mu_Dir.mu_Pending) ; 
}
  if (!(mu__boolexpr9)) mu__boolexpr8 = FALSE ;
  else {
  mu__boolexpr8 = (mu_Sta.mu_Dir.mu_InvSet[mu_src]) ; 
}
    return mu__boolexpr8;
  }

  void NextRule(unsigned & what_rule)
  {
    unsigned r = what_rule - 6;
    static mu_1_NODE mu_src;
    mu_src.value((r % 3) + 1);
    r = r / 3;
    while (what_rule < 9 )
      {
	if ( ( TRUE  ) ) {
bool mu__boolexpr11;
bool mu__boolexpr12;
bool mu__boolexpr13;
  if (!((mu_src) != (mu_Home))) mu__boolexpr13 = FALSE ;
  else {
  mu__boolexpr13 = ((mu_Sta.mu_InvMsg[mu_src].mu_Cmd) == (mu_INV_InvAck)) ; 
}
  if (!(mu__boolexpr13)) mu__boolexpr12 = FALSE ;
  else {
  mu__boolexpr12 = (mu_Sta.mu_Dir.mu_Pending) ; 
}
  if (!(mu__boolexpr12)) mu__boolexpr11 = FALSE ;
  else {
  mu__boolexpr11 = (mu_Sta.mu_Dir.mu_InvSet[mu_src]) ; 
}
	      if (mu__boolexpr11) {
		if ( ( TRUE  ) )
		  return;
		else
		  what_rule++;
	      }
	      else
		what_rule += 1;
	}
	else
	  what_rule += 1;
    r = what_rule - 6;
    mu_src.value((r % 3) + 1);
    r = r / 3;
    }
  }

  void Code(unsigned r)
  {
    static mu_1_NODE mu_src;
    mu_src.value((r % 3) + 1);
    r = r / 3;
/*** Variable declaration ***/
mu_1_STATE mu_NxtSta("NxtSta",0);

mu_NxtSta = mu_Sta;
mu_NxtSta.mu_InvMsg[mu_src].mu_Cmd = mu_INV_None;
mu_NxtSta.mu_Dir.mu_InvSet[mu_src] = mu_false;
bool mu__quant14; 
mu__quant14 = FALSE;
{
for(int mu_p = 1; mu_p <= 3; mu_p++) {
bool mu__boolexpr15;
  if (!((mu_p) != (mu_src))) mu__boolexpr15 = FALSE ;
  else {
  mu__boolexpr15 = (mu_Sta.mu_Dir.mu_InvSet[mu_p]) ; 
}
if ( (mu__boolexpr15) )
  { mu__quant14 = TRUE; break; }
};
};
if ( mu__quant14 )
{
mu_NxtSta.mu_LastInvAck = mu_src;
{
for(int mu_p = 1; mu_p <= 3; mu_p++) {
bool mu__boolexpr16;
  if (!((mu_p) != (mu_src))) mu__boolexpr16 = FALSE ;
  else {
  mu__boolexpr16 = (mu_Sta.mu_Dir.mu_InvSet[mu_p]) ; 
}
if ( mu__boolexpr16 )
{
mu_NxtSta.mu_LastOtherInvAck = mu_p;
}
};
};
}
else
{
mu_NxtSta.mu_Dir.mu_Pending = mu_false;
bool mu__boolexpr17;
  if (!(mu_Sta.mu_Dir.mu_Local)) mu__boolexpr17 = FALSE ;
  else {
  mu__boolexpr17 = (!(mu_Sta.mu_Dir.mu_Dirty)) ; 
}
if ( mu__boolexpr17 )
{
mu_NxtSta.mu_Dir.mu_Local = mu_false;
}
mu_NxtSta.mu_Collecting = mu_false;
mu_NxtSta.mu_LastInvAck = mu_src;
}
mu_Sta = mu_NxtSta;
  };

};
/******************** RuleBase5 ********************/
class RuleBase5
{
public:
  int Priority()
  {
    return 0;
  }
  char * Name(unsigned r)
  {
    static mu_1_NODE mu_dst;
    mu_dst.value((r % 3) + 1);
    r = r / 3;
    return tsprintf("NI_Inv, dst:%s", mu_dst.Name());
  }
  bool Condition(unsigned r)
  {
    static mu_1_NODE mu_dst;
    mu_dst.value((r % 3) + 1);
    r = r / 3;
bool mu__boolexpr18;
  if (!((mu_dst) != (mu_Home))) mu__boolexpr18 = FALSE ;
  else {
  mu__boolexpr18 = ((mu_Sta.mu_InvMsg[mu_dst].mu_Cmd) == (mu_INV_Inv)) ; 
}
    return mu__boolexpr18;
  }

  void NextRule(unsigned & what_rule)
  {
    unsigned r = what_rule - 9;
    static mu_1_NODE mu_dst;
    mu_dst.value((r % 3) + 1);
    r = r / 3;
    while (what_rule < 12 )
      {
	if ( ( TRUE  ) ) {
bool mu__boolexpr19;
  if (!((mu_dst) != (mu_Home))) mu__boolexpr19 = FALSE ;
  else {
  mu__boolexpr19 = ((mu_Sta.mu_InvMsg[mu_dst].mu_Cmd) == (mu_INV_Inv)) ; 
}
	      if (mu__boolexpr19) {
		if ( ( TRUE  ) )
		  return;
		else
		  what_rule++;
	      }
	      else
		what_rule += 1;
	}
	else
	  what_rule += 1;
    r = what_rule - 9;
    mu_dst.value((r % 3) + 1);
    r = r / 3;
    }
  }

  void Code(unsigned r)
  {
    static mu_1_NODE mu_dst;
    mu_dst.value((r % 3) + 1);
    r = r / 3;
/*** Variable declaration ***/
mu_1_STATE mu_NxtSta("NxtSta",0);

mu_NxtSta = mu_Sta;
mu_NxtSta.mu_InvMsg[mu_dst].mu_Cmd = mu_INV_InvAck;
mu_NxtSta.mu_Proc[mu_dst].mu_CacheState = mu_CACHE_I;
mu_NxtSta.mu_Proc[mu_dst].mu_CacheData.undefine();
if ( (mu_Sta.mu_Proc[mu_dst].mu_ProcCmd) == (mu_NODE_Get) )
{
mu_NxtSta.mu_Proc[mu_dst].mu_InvMarked = mu_true;
}
mu_Sta = mu_NxtSta;
  };

};
/******************** RuleBase6 ********************/
class RuleBase6
{
public:
  int Priority()
  {
    return 0;
  }
  char * Name(unsigned r)
  {
    static mu_1_NODE mu_dst;
    mu_dst.value((r % 3) + 1);
    r = r / 3;
    return tsprintf("NI_Remote_PutX, dst:%s", mu_dst.Name());
  }
  bool Condition(unsigned r)
  {
    static mu_1_NODE mu_dst;
    mu_dst.value((r % 3) + 1);
    r = r / 3;
bool mu__boolexpr20;
bool mu__boolexpr21;
  if (!((mu_dst) != (mu_Home))) mu__boolexpr21 = FALSE ;
  else {
  mu__boolexpr21 = ((mu_Sta.mu_UniMsg[mu_dst].mu_Cmd) == (mu_UNI_PutX)) ; 
}
  if (!(mu__boolexpr21)) mu__boolexpr20 = FALSE ;
  else {
  mu__boolexpr20 = ((mu_Sta.mu_Proc[mu_dst].mu_ProcCmd) == (mu_NODE_GetX)) ; 
}
    return mu__boolexpr20;
  }

  void NextRule(unsigned & what_rule)
  {
    unsigned r = what_rule - 12;
    static mu_1_NODE mu_dst;
    mu_dst.value((r % 3) + 1);
    r = r / 3;
    while (what_rule < 15 )
      {
	if ( ( TRUE  ) ) {
bool mu__boolexpr22;
bool mu__boolexpr23;
  if (!((mu_dst) != (mu_Home))) mu__boolexpr23 = FALSE ;
  else {
  mu__boolexpr23 = ((mu_Sta.mu_UniMsg[mu_dst].mu_Cmd) == (mu_UNI_PutX)) ; 
}
  if (!(mu__boolexpr23)) mu__boolexpr22 = FALSE ;
  else {
  mu__boolexpr22 = ((mu_Sta.mu_Proc[mu_dst].mu_ProcCmd) == (mu_NODE_GetX)) ; 
}
	      if (mu__boolexpr22) {
		if ( ( TRUE  ) )
		  return;
		else
		  what_rule++;
	      }
	      else
		what_rule += 1;
	}
	else
	  what_rule += 1;
    r = what_rule - 12;
    mu_dst.value((r % 3) + 1);
    r = r / 3;
    }
  }

  void Code(unsigned r)
  {
    static mu_1_NODE mu_dst;
    mu_dst.value((r % 3) + 1);
    r = r / 3;
/*** Variable declaration ***/
mu_1_STATE mu_NxtSta("NxtSta",0);

mu_NxtSta = mu_Sta;
mu_NxtSta.mu_UniMsg[mu_dst].mu_Cmd = mu_UNI_None;
mu_NxtSta.mu_UniMsg[mu_dst].mu_Proc.undefine();
mu_NxtSta.mu_UniMsg[mu_dst].mu_Data.undefine();
mu_NxtSta.mu_Proc[mu_dst].mu_ProcCmd = mu_NODE_None;
mu_NxtSta.mu_Proc[mu_dst].mu_InvMarked = mu_false;
mu_NxtSta.mu_Proc[mu_dst].mu_CacheState = mu_CACHE_E;
mu_NxtSta.mu_Proc[mu_dst].mu_CacheData = mu_Sta.mu_UniMsg[mu_dst].mu_Data;
mu_Sta = mu_NxtSta;
  };

};
/******************** RuleBase7 ********************/
class RuleBase7
{
public:
  int Priority()
  {
    return 0;
  }
  char * Name(unsigned r)
  {
    return tsprintf("NI_Local_PutXAcksDone");
  }
  bool Condition(unsigned r)
  {
    return (mu_Sta.mu_UniMsg[mu_Home].mu_Cmd) == (mu_UNI_PutX);
  }

  void NextRule(unsigned & what_rule)
  {
    unsigned r = what_rule - 15;
    while (what_rule < 16 )
      {
	if ( ( TRUE  ) ) {
	      if ((mu_Sta.mu_UniMsg[mu_Home].mu_Cmd) == (mu_UNI_PutX)) {
		if ( ( TRUE  ) )
		  return;
		else
		  what_rule++;
	      }
	      else
		what_rule += 1;
	}
	else
	  what_rule += 1;
    r = what_rule - 15;
    }
  }

  void Code(unsigned r)
  {
/*** Variable declaration ***/
mu_1_STATE mu_NxtSta("NxtSta",0);

mu_NxtSta = mu_Sta;
mu_NxtSta.mu_UniMsg[mu_Home].mu_Cmd = mu_UNI_None;
mu_NxtSta.mu_UniMsg[mu_Home].mu_Proc.undefine();
mu_NxtSta.mu_UniMsg[mu_Home].mu_Data.undefine();
mu_NxtSta.mu_Dir.mu_Pending = mu_false;
mu_NxtSta.mu_Dir.mu_Local = mu_true;
mu_NxtSta.mu_Dir.mu_HeadVld = mu_false;
mu_NxtSta.mu_Dir.mu_HeadPtr.undefine();
mu_NxtSta.mu_Proc[mu_Home].mu_ProcCmd = mu_NODE_None;
mu_NxtSta.mu_Proc[mu_Home].mu_InvMarked = mu_false;
mu_NxtSta.mu_Proc[mu_Home].mu_CacheState = mu_CACHE_E;
mu_NxtSta.mu_Proc[mu_Home].mu_CacheData = mu_Sta.mu_UniMsg[mu_Home].mu_Data;
mu_Sta = mu_NxtSta;
  };

};
/******************** RuleBase8 ********************/
class RuleBase8
{
public:
  int Priority()
  {
    return 0;
  }
  char * Name(unsigned r)
  {
    static mu_1_NODE mu_dst;
    mu_dst.value((r % 3) + 1);
    r = r / 3;
    return tsprintf("NI_Remote_Put, dst:%s", mu_dst.Name());
  }
  bool Condition(unsigned r)
  {
    static mu_1_NODE mu_dst;
    mu_dst.value((r % 3) + 1);
    r = r / 3;
bool mu__boolexpr24;
  if (!((mu_dst) != (mu_Home))) mu__boolexpr24 = FALSE ;
  else {
  mu__boolexpr24 = ((mu_Sta.mu_UniMsg[mu_dst].mu_Cmd) == (mu_UNI_Put)) ; 
}
    return mu__boolexpr24;
  }

  void NextRule(unsigned & what_rule)
  {
    unsigned r = what_rule - 16;
    static mu_1_NODE mu_dst;
    mu_dst.value((r % 3) + 1);
    r = r / 3;
    while (what_rule < 19 )
      {
	if ( ( TRUE  ) ) {
bool mu__boolexpr25;
  if (!((mu_dst) != (mu_Home))) mu__boolexpr25 = FALSE ;
  else {
  mu__boolexpr25 = ((mu_Sta.mu_UniMsg[mu_dst].mu_Cmd) == (mu_UNI_Put)) ; 
}
	      if (mu__boolexpr25) {
		if ( ( TRUE  ) )
		  return;
		else
		  what_rule++;
	      }
	      else
		what_rule += 1;
	}
	else
	  what_rule += 1;
    r = what_rule - 16;
    mu_dst.value((r % 3) + 1);
    r = r / 3;
    }
  }

  void Code(unsigned r)
  {
    static mu_1_NODE mu_dst;
    mu_dst.value((r % 3) + 1);
    r = r / 3;
/*** Variable declaration ***/
mu_1_STATE mu_NxtSta("NxtSta",0);

mu_NxtSta = mu_Sta;
mu_NxtSta.mu_UniMsg[mu_dst].mu_Cmd = mu_UNI_None;
mu_NxtSta.mu_UniMsg[mu_dst].mu_Proc.undefine();
mu_NxtSta.mu_UniMsg[mu_dst].mu_Data.undefine();
mu_NxtSta.mu_Proc[mu_dst].mu_ProcCmd = mu_NODE_None;
if ( mu_Sta.mu_Proc[mu_dst].mu_InvMarked )
{
mu_NxtSta.mu_Proc[mu_dst].mu_InvMarked = mu_false;
mu_NxtSta.mu_Proc[mu_dst].mu_CacheState = mu_CACHE_I;
mu_NxtSta.mu_Proc[mu_dst].mu_CacheData.undefine();
}
else
{
mu_NxtSta.mu_Proc[mu_dst].mu_CacheState = mu_CACHE_S;
mu_NxtSta.mu_Proc[mu_dst].mu_CacheData = mu_Sta.mu_UniMsg[mu_dst].mu_Data;
}
mu_Sta = mu_NxtSta;
  };

};
/******************** RuleBase9 ********************/
class RuleBase9
{
public:
  int Priority()
  {
    return 0;
  }
  char * Name(unsigned r)
  {
    return tsprintf("NI_Local_Put");
  }
  bool Condition(unsigned r)
  {
    return (mu_Sta.mu_UniMsg[mu_Home].mu_Cmd) == (mu_UNI_Put);
  }

  void NextRule(unsigned & what_rule)
  {
    unsigned r = what_rule - 19;
    while (what_rule < 20 )
      {
	if ( ( TRUE  ) ) {
	      if ((mu_Sta.mu_UniMsg[mu_Home].mu_Cmd) == (mu_UNI_Put)) {
		if ( ( TRUE  ) )
		  return;
		else
		  what_rule++;
	      }
	      else
		what_rule += 1;
	}
	else
	  what_rule += 1;
    r = what_rule - 19;
    }
  }

  void Code(unsigned r)
  {
/*** Variable declaration ***/
mu_1_STATE mu_NxtSta("NxtSta",0);

mu_NxtSta = mu_Sta;
mu_NxtSta.mu_UniMsg[mu_Home].mu_Cmd = mu_UNI_None;
mu_NxtSta.mu_UniMsg[mu_Home].mu_Proc.undefine();
mu_NxtSta.mu_UniMsg[mu_Home].mu_Data.undefine();
mu_NxtSta.mu_Dir.mu_Pending = mu_false;
mu_NxtSta.mu_Dir.mu_Dirty = mu_false;
mu_NxtSta.mu_Dir.mu_Local = mu_true;
mu_NxtSta.mu_MemData = mu_Sta.mu_UniMsg[mu_Home].mu_Data;
mu_NxtSta.mu_Proc[mu_Home].mu_ProcCmd = mu_NODE_None;
if ( mu_Sta.mu_Proc[mu_Home].mu_InvMarked )
{
mu_NxtSta.mu_Proc[mu_Home].mu_InvMarked = mu_false;
mu_NxtSta.mu_Proc[mu_Home].mu_CacheState = mu_CACHE_I;
mu_NxtSta.mu_Proc[mu_Home].mu_CacheData.undefine();
}
else
{
mu_NxtSta.mu_Proc[mu_Home].mu_CacheState = mu_CACHE_S;
mu_NxtSta.mu_Proc[mu_Home].mu_CacheData = mu_Sta.mu_UniMsg[mu_Home].mu_Data;
}
mu_Sta = mu_NxtSta;
  };

};
/******************** RuleBase10 ********************/
class RuleBase10
{
public:
  int Priority()
  {
    return 0;
  }
  char * Name(unsigned r)
  {
    static mu_1_NODE mu_dst;
    mu_dst.value((r % 3) + 1);
    r = r / 3;
    static mu_1_NODE mu_src;
    mu_src.value((r % 3) + 1);
    r = r / 3;
    return tsprintf("NI_Remote_GetX_PutX, dst:%s, src:%s", mu_dst.Name(), mu_src.Name());
  }
  bool Condition(unsigned r)
  {
    static mu_1_NODE mu_dst;
    mu_dst.value((r % 3) + 1);
    r = r / 3;
    static mu_1_NODE mu_src;
    mu_src.value((r % 3) + 1);
    r = r / 3;
bool mu__boolexpr26;
bool mu__boolexpr27;
bool mu__boolexpr28;
bool mu__boolexpr29;
  if (!((mu_src) != (mu_dst))) mu__boolexpr29 = FALSE ;
  else {
  mu__boolexpr29 = ((mu_dst) != (mu_Home)) ; 
}
  if (!(mu__boolexpr29)) mu__boolexpr28 = FALSE ;
  else {
  mu__boolexpr28 = ((mu_Sta.mu_UniMsg[mu_src].mu_Cmd) == (mu_UNI_GetX)) ; 
}
  if (!(mu__boolexpr28)) mu__boolexpr27 = FALSE ;
  else {
  mu__boolexpr27 = ((mu_Sta.mu_UniMsg[mu_src].mu_Proc) == (mu_dst)) ; 
}
  if (!(mu__boolexpr27)) mu__boolexpr26 = FALSE ;
  else {
  mu__boolexpr26 = ((mu_Sta.mu_Proc[mu_dst].mu_CacheState) == (mu_CACHE_E)) ; 
}
    return mu__boolexpr26;
  }

  void NextRule(unsigned & what_rule)
  {
    unsigned r = what_rule - 20;
    static mu_1_NODE mu_dst;
    mu_dst.value((r % 3) + 1);
    r = r / 3;
    static mu_1_NODE mu_src;
    mu_src.value((r % 3) + 1);
    r = r / 3;
    while (what_rule < 29 )
      {
	if ( ( TRUE  ) ) {
bool mu__boolexpr30;
bool mu__boolexpr31;
bool mu__boolexpr32;
bool mu__boolexpr33;
  if (!((mu_src) != (mu_dst))) mu__boolexpr33 = FALSE ;
  else {
  mu__boolexpr33 = ((mu_dst) != (mu_Home)) ; 
}
  if (!(mu__boolexpr33)) mu__boolexpr32 = FALSE ;
  else {
  mu__boolexpr32 = ((mu_Sta.mu_UniMsg[mu_src].mu_Cmd) == (mu_UNI_GetX)) ; 
}
  if (!(mu__boolexpr32)) mu__boolexpr31 = FALSE ;
  else {
  mu__boolexpr31 = ((mu_Sta.mu_UniMsg[mu_src].mu_Proc) == (mu_dst)) ; 
}
  if (!(mu__boolexpr31)) mu__boolexpr30 = FALSE ;
  else {
  mu__boolexpr30 = ((mu_Sta.mu_Proc[mu_dst].mu_CacheState) == (mu_CACHE_E)) ; 
}
	      if (mu__boolexpr30) {
		if ( ( TRUE  ) )
		  return;
		else
		  what_rule++;
	      }
	      else
		what_rule += 1;
	}
	else
	  what_rule += 1;
    r = what_rule - 20;
    mu_dst.value((r % 3) + 1);
    r = r / 3;
    mu_src.value((r % 3) + 1);
    r = r / 3;
    }
  }

  void Code(unsigned r)
  {
    static mu_1_NODE mu_dst;
    mu_dst.value((r % 3) + 1);
    r = r / 3;
    static mu_1_NODE mu_src;
    mu_src.value((r % 3) + 1);
    r = r / 3;
/*** Variable declaration ***/
mu_1_STATE mu_NxtSta("NxtSta",0);

mu_NxtSta = mu_Sta;
mu_NxtSta.mu_Proc[mu_dst].mu_CacheState = mu_CACHE_I;
mu_NxtSta.mu_Proc[mu_dst].mu_CacheData.undefine();
mu_NxtSta.mu_UniMsg[mu_src].mu_Cmd = mu_UNI_PutX;
mu_NxtSta.mu_UniMsg[mu_src].mu_Proc = mu_dst;
mu_NxtSta.mu_UniMsg[mu_src].mu_Data = mu_Sta.mu_Proc[mu_dst].mu_CacheData;
if ( (mu_src) != (mu_Home) )
{
mu_NxtSta.mu_ShWbMsg.mu_Cmd = mu_SHWB_FAck;
mu_NxtSta.mu_ShWbMsg.mu_Proc = mu_src;
mu_NxtSta.mu_ShWbMsg.mu_Data.undefine();
}
mu_NxtSta.mu_FwdCmd = mu_UNI_None;
mu_NxtSta.mu_FwdSrc = mu_src;
mu_Sta = mu_NxtSta;
  };

};
/******************** RuleBase11 ********************/
class RuleBase11
{
public:
  int Priority()
  {
    return 0;
  }
  char * Name(unsigned r)
  {
    static mu_1_NODE mu_dst;
    mu_dst.value((r % 3) + 1);
    r = r / 3;
    static mu_1_NODE mu_src;
    mu_src.value((r % 3) + 1);
    r = r / 3;
    return tsprintf("NI_Remote_GetX_Nak, dst:%s, src:%s", mu_dst.Name(), mu_src.Name());
  }
  bool Condition(unsigned r)
  {
    static mu_1_NODE mu_dst;
    mu_dst.value((r % 3) + 1);
    r = r / 3;
    static mu_1_NODE mu_src;
    mu_src.value((r % 3) + 1);
    r = r / 3;
bool mu__boolexpr34;
bool mu__boolexpr35;
bool mu__boolexpr36;
bool mu__boolexpr37;
  if (!((mu_src) != (mu_dst))) mu__boolexpr37 = FALSE ;
  else {
  mu__boolexpr37 = ((mu_dst) != (mu_Home)) ; 
}
  if (!(mu__boolexpr37)) mu__boolexpr36 = FALSE ;
  else {
  mu__boolexpr36 = ((mu_Sta.mu_UniMsg[mu_src].mu_Cmd) == (mu_UNI_GetX)) ; 
}
  if (!(mu__boolexpr36)) mu__boolexpr35 = FALSE ;
  else {
  mu__boolexpr35 = ((mu_Sta.mu_UniMsg[mu_src].mu_Proc) == (mu_dst)) ; 
}
  if (!(mu__boolexpr35)) mu__boolexpr34 = FALSE ;
  else {
  mu__boolexpr34 = ((mu_Sta.mu_Proc[mu_dst].mu_CacheState) != (mu_CACHE_E)) ; 
}
    return mu__boolexpr34;
  }

  void NextRule(unsigned & what_rule)
  {
    unsigned r = what_rule - 29;
    static mu_1_NODE mu_dst;
    mu_dst.value((r % 3) + 1);
    r = r / 3;
    static mu_1_NODE mu_src;
    mu_src.value((r % 3) + 1);
    r = r / 3;
    while (what_rule < 38 )
      {
	if ( ( TRUE  ) ) {
bool mu__boolexpr38;
bool mu__boolexpr39;
bool mu__boolexpr40;
bool mu__boolexpr41;
  if (!((mu_src) != (mu_dst))) mu__boolexpr41 = FALSE ;
  else {
  mu__boolexpr41 = ((mu_dst) != (mu_Home)) ; 
}
  if (!(mu__boolexpr41)) mu__boolexpr40 = FALSE ;
  else {
  mu__boolexpr40 = ((mu_Sta.mu_UniMsg[mu_src].mu_Cmd) == (mu_UNI_GetX)) ; 
}
  if (!(mu__boolexpr40)) mu__boolexpr39 = FALSE ;
  else {
  mu__boolexpr39 = ((mu_Sta.mu_UniMsg[mu_src].mu_Proc) == (mu_dst)) ; 
}
  if (!(mu__boolexpr39)) mu__boolexpr38 = FALSE ;
  else {
  mu__boolexpr38 = ((mu_Sta.mu_Proc[mu_dst].mu_CacheState) != (mu_CACHE_E)) ; 
}
	      if (mu__boolexpr38) {
		if ( ( TRUE  ) )
		  return;
		else
		  what_rule++;
	      }
	      else
		what_rule += 1;
	}
	else
	  what_rule += 1;
    r = what_rule - 29;
    mu_dst.value((r % 3) + 1);
    r = r / 3;
    mu_src.value((r % 3) + 1);
    r = r / 3;
    }
  }

  void Code(unsigned r)
  {
    static mu_1_NODE mu_dst;
    mu_dst.value((r % 3) + 1);
    r = r / 3;
    static mu_1_NODE mu_src;
    mu_src.value((r % 3) + 1);
    r = r / 3;
/*** Variable declaration ***/
mu_1_STATE mu_NxtSta("NxtSta",0);

mu_NxtSta = mu_Sta;
mu_NxtSta.mu_UniMsg[mu_src].mu_Cmd = mu_UNI_Nak;
mu_NxtSta.mu_UniMsg[mu_src].mu_Proc = mu_dst;
mu_NxtSta.mu_UniMsg[mu_src].mu_Data.undefine();
mu_NxtSta.mu_NakcMsg.mu_Cmd = mu_NAKC_Nakc;
mu_NxtSta.mu_FwdCmd = mu_UNI_None;
mu_NxtSta.mu_FwdSrc = mu_src;
mu_Sta = mu_NxtSta;
  };

};
/******************** RuleBase12 ********************/
class RuleBase12
{
public:
  int Priority()
  {
    return 0;
  }
  char * Name(unsigned r)
  {
    static mu_1_NODE mu_src;
    mu_src.value((r % 3) + 1);
    r = r / 3;
    return tsprintf("NI_Local_GetX_PutX, src:%s", mu_src.Name());
  }
  bool Condition(unsigned r)
  {
    static mu_1_NODE mu_src;
    mu_src.value((r % 3) + 1);
    r = r / 3;
bool mu__boolexpr42;
bool mu__boolexpr43;
bool mu__boolexpr44;
bool mu__boolexpr45;
  if (!((mu_src) != (mu_Home))) mu__boolexpr45 = FALSE ;
  else {
  mu__boolexpr45 = ((mu_Sta.mu_UniMsg[mu_src].mu_Cmd) == (mu_UNI_GetX)) ; 
}
  if (!(mu__boolexpr45)) mu__boolexpr44 = FALSE ;
  else {
  mu__boolexpr44 = ((mu_Sta.mu_UniMsg[mu_src].mu_Proc) == (mu_Home)) ; 
}
  if (!(mu__boolexpr44)) mu__boolexpr43 = FALSE ;
  else {
  mu__boolexpr43 = (!(mu_Sta.mu_Dir.mu_Pending)) ; 
}
  if (!(mu__boolexpr43)) mu__boolexpr42 = FALSE ;
  else {
bool mu__boolexpr46;
  if (!(mu_Sta.mu_Dir.mu_Dirty)) mu__boolexpr46 = TRUE ;
  else {
bool mu__boolexpr47;
  if (!(mu_Sta.mu_Dir.mu_Local)) mu__boolexpr47 = FALSE ;
  else {
  mu__boolexpr47 = ((mu_Sta.mu_Proc[mu_Home].mu_CacheState) == (mu_CACHE_E)) ; 
}
  mu__boolexpr46 = (mu__boolexpr47) ; 
}
  mu__boolexpr42 = (mu__boolexpr46) ; 
}
    return mu__boolexpr42;
  }

  void NextRule(unsigned & what_rule)
  {
    unsigned r = what_rule - 38;
    static mu_1_NODE mu_src;
    mu_src.value((r % 3) + 1);
    r = r / 3;
    while (what_rule < 41 )
      {
	if ( ( TRUE  ) ) {
bool mu__boolexpr48;
bool mu__boolexpr49;
bool mu__boolexpr50;
bool mu__boolexpr51;
  if (!((mu_src) != (mu_Home))) mu__boolexpr51 = FALSE ;
  else {
  mu__boolexpr51 = ((mu_Sta.mu_UniMsg[mu_src].mu_Cmd) == (mu_UNI_GetX)) ; 
}
  if (!(mu__boolexpr51)) mu__boolexpr50 = FALSE ;
  else {
  mu__boolexpr50 = ((mu_Sta.mu_UniMsg[mu_src].mu_Proc) == (mu_Home)) ; 
}
  if (!(mu__boolexpr50)) mu__boolexpr49 = FALSE ;
  else {
  mu__boolexpr49 = (!(mu_Sta.mu_Dir.mu_Pending)) ; 
}
  if (!(mu__boolexpr49)) mu__boolexpr48 = FALSE ;
  else {
bool mu__boolexpr52;
  if (!(mu_Sta.mu_Dir.mu_Dirty)) mu__boolexpr52 = TRUE ;
  else {
bool mu__boolexpr53;
  if (!(mu_Sta.mu_Dir.mu_Local)) mu__boolexpr53 = FALSE ;
  else {
  mu__boolexpr53 = ((mu_Sta.mu_Proc[mu_Home].mu_CacheState) == (mu_CACHE_E)) ; 
}
  mu__boolexpr52 = (mu__boolexpr53) ; 
}
  mu__boolexpr48 = (mu__boolexpr52) ; 
}
	      if (mu__boolexpr48) {
		if ( ( TRUE  ) )
		  return;
		else
		  what_rule++;
	      }
	      else
		what_rule += 1;
	}
	else
	  what_rule += 1;
    r = what_rule - 38;
    mu_src.value((r % 3) + 1);
    r = r / 3;
    }
  }

  void Code(unsigned r)
  {
    static mu_1_NODE mu_src;
    mu_src.value((r % 3) + 1);
    r = r / 3;
/*** Variable declaration ***/
mu_1_STATE mu_NxtSta("NxtSta",0);

mu_NxtSta = mu_Sta;
if ( mu_Sta.mu_Dir.mu_Dirty )
{
mu_NxtSta.mu_Dir.mu_Local = mu_false;
mu_NxtSta.mu_Dir.mu_Dirty = mu_true;
mu_NxtSta.mu_Dir.mu_HeadVld = mu_true;
mu_NxtSta.mu_Dir.mu_HeadPtr = mu_src;
mu_NxtSta.mu_Dir.mu_ShrVld = mu_false;
{
for(int mu_p = 1; mu_p <= 3; mu_p++) {
mu_NxtSta.mu_Dir.mu_ShrSet[mu_p] = mu_false;
mu_NxtSta.mu_Dir.mu_InvSet[mu_p] = mu_false;
};
};
mu_NxtSta.mu_UniMsg[mu_src].mu_Cmd = mu_UNI_PutX;
if (mu_Home.isundefined())
  mu_NxtSta.mu_UniMsg[mu_src].mu_Proc.undefine();
else
  mu_NxtSta.mu_UniMsg[mu_src].mu_Proc = mu_Home;
mu_NxtSta.mu_UniMsg[mu_src].mu_Data = mu_Sta.mu_Proc[mu_Home].mu_CacheData;
mu_NxtSta.mu_Proc[mu_Home].mu_CacheState = mu_CACHE_I;
mu_NxtSta.mu_Proc[mu_Home].mu_CacheData.undefine();
}
else
{
bool mu__boolexpr54;
  if (!(mu_Sta.mu_Dir.mu_HeadVld)) mu__boolexpr54 = TRUE ;
  else {
bool mu__boolexpr55;
  if (!((mu_Sta.mu_Dir.mu_HeadPtr) == (mu_src))) mu__boolexpr55 = FALSE ;
  else {
bool mu__quant56; 
mu__quant56 = TRUE;
{
for(int mu_p = 1; mu_p <= 3; mu_p++) {
bool mu__boolexpr57;
  if (!((mu_p) != (mu_src))) mu__boolexpr57 = TRUE ;
  else {
  mu__boolexpr57 = (!(mu_Sta.mu_Dir.mu_ShrSet[mu_p])) ; 
}
if ( !(mu__boolexpr57) )
  { mu__quant56 = FALSE; break; }
};
};
  mu__boolexpr55 = (mu__quant56) ; 
}
  mu__boolexpr54 = (mu__boolexpr55) ; 
}
if ( mu__boolexpr54 )
{
mu_NxtSta.mu_Dir.mu_Local = mu_false;
mu_NxtSta.mu_Dir.mu_Dirty = mu_true;
mu_NxtSta.mu_Dir.mu_HeadVld = mu_true;
mu_NxtSta.mu_Dir.mu_HeadPtr = mu_src;
mu_NxtSta.mu_Dir.mu_ShrVld = mu_false;
{
for(int mu_p = 1; mu_p <= 3; mu_p++) {
mu_NxtSta.mu_Dir.mu_ShrSet[mu_p] = mu_false;
mu_NxtSta.mu_Dir.mu_InvSet[mu_p] = mu_false;
};
};
mu_NxtSta.mu_UniMsg[mu_src].mu_Cmd = mu_UNI_PutX;
if (mu_Home.isundefined())
  mu_NxtSta.mu_UniMsg[mu_src].mu_Proc.undefine();
else
  mu_NxtSta.mu_UniMsg[mu_src].mu_Proc = mu_Home;
mu_NxtSta.mu_UniMsg[mu_src].mu_Data = mu_Sta.mu_MemData;
mu_NxtSta.mu_Proc[mu_Home].mu_CacheState = mu_CACHE_I;
mu_NxtSta.mu_Proc[mu_Home].mu_CacheData.undefine();
if ( mu_Sta.mu_Dir.mu_Local )
{
mu_NxtSta.mu_Proc[mu_Home].mu_CacheState = mu_CACHE_I;
mu_NxtSta.mu_Proc[mu_Home].mu_CacheData.undefine();
if ( (mu_Sta.mu_Proc[mu_Home].mu_ProcCmd) == (mu_NODE_Get) )
{
mu_NxtSta.mu_Proc[mu_Home].mu_InvMarked = mu_true;
}
}
}
else
{
mu_NxtSta.mu_Dir.mu_Pending = mu_true;
mu_NxtSta.mu_Dir.mu_Local = mu_false;
mu_NxtSta.mu_Dir.mu_Dirty = mu_true;
mu_NxtSta.mu_Dir.mu_HeadVld = mu_true;
mu_NxtSta.mu_Dir.mu_HeadPtr = mu_src;
mu_NxtSta.mu_Dir.mu_ShrVld = mu_false;
{
for(int mu_p = 1; mu_p <= 3; mu_p++) {
mu_NxtSta.mu_Dir.mu_ShrSet[mu_p] = mu_false;
bool mu__boolexpr58;
bool mu__boolexpr59;
  if (!((mu_p) != (mu_Home))) mu__boolexpr59 = FALSE ;
  else {
  mu__boolexpr59 = ((mu_p) != (mu_src)) ; 
}
  if (!(mu__boolexpr59)) mu__boolexpr58 = FALSE ;
  else {
bool mu__boolexpr60;
bool mu__boolexpr61;
  if (!(mu_Sta.mu_Dir.mu_ShrVld)) mu__boolexpr61 = FALSE ;
  else {
  mu__boolexpr61 = (mu_Sta.mu_Dir.mu_ShrSet[mu_p]) ; 
}
  if (mu__boolexpr61) mu__boolexpr60 = TRUE ;
  else {
bool mu__boolexpr62;
  if (!(mu_Sta.mu_Dir.mu_HeadVld)) mu__boolexpr62 = FALSE ;
  else {
  mu__boolexpr62 = ((mu_Sta.mu_Dir.mu_HeadPtr) == (mu_p)) ; 
}
  mu__boolexpr60 = (mu__boolexpr62) ; 
}
  mu__boolexpr58 = (mu__boolexpr60) ; 
}
if ( mu__boolexpr58 )
{
mu_NxtSta.mu_Dir.mu_InvSet[mu_p] = mu_true;
mu_NxtSta.mu_InvMsg[mu_p].mu_Cmd = mu_INV_Inv;
}
else
{
mu_NxtSta.mu_Dir.mu_InvSet[mu_p] = mu_false;
mu_NxtSta.mu_InvMsg[mu_p].mu_Cmd = mu_INV_None;
}
};
};
mu_NxtSta.mu_UniMsg[mu_src].mu_Cmd = mu_UNI_PutX;
if (mu_Home.isundefined())
  mu_NxtSta.mu_UniMsg[mu_src].mu_Proc.undefine();
else
  mu_NxtSta.mu_UniMsg[mu_src].mu_Proc = mu_Home;
mu_NxtSta.mu_UniMsg[mu_src].mu_Data = mu_Sta.mu_MemData;
if ( mu_Sta.mu_Dir.mu_Local )
{
mu_NxtSta.mu_Proc[mu_Home].mu_CacheState = mu_CACHE_I;
mu_NxtSta.mu_Proc[mu_Home].mu_CacheData.undefine();
if ( (mu_Sta.mu_Proc[mu_Home].mu_ProcCmd) == (mu_NODE_Get) )
{
mu_NxtSta.mu_Proc[mu_Home].mu_InvMarked = mu_true;
}
}
mu_NxtSta.mu_PendReqSrc = mu_src;
mu_NxtSta.mu_PendReqCmd = mu_UNI_GetX;
mu_NxtSta.mu_Collecting = mu_true;
mu_NxtSta.mu_PrevData = mu_Sta.mu_CurrData;
if ( (mu_Sta.mu_Dir.mu_HeadPtr) != (mu_src) )
{
mu_NxtSta.mu_LastOtherInvAck = mu_Sta.mu_Dir.mu_HeadPtr;
}
else
{
{
for(int mu_p = 1; mu_p <= 3; mu_p++) {
bool mu__boolexpr63;
  if (!((mu_p) != (mu_src))) mu__boolexpr63 = FALSE ;
  else {
  mu__boolexpr63 = (mu_Sta.mu_Dir.mu_ShrSet[mu_p]) ; 
}
if ( mu__boolexpr63 )
{
mu_NxtSta.mu_LastOtherInvAck = mu_p;
}
};
};
}
}
}
mu_Sta = mu_NxtSta;
  };

};
/******************** RuleBase13 ********************/
class RuleBase13
{
public:
  int Priority()
  {
    return 0;
  }
  char * Name(unsigned r)
  {
    static mu_1_NODE mu_src;
    mu_src.value((r % 3) + 1);
    r = r / 3;
    return tsprintf("NI_Local_GetX_GetX, src:%s", mu_src.Name());
  }
  bool Condition(unsigned r)
  {
    static mu_1_NODE mu_src;
    mu_src.value((r % 3) + 1);
    r = r / 3;
bool mu__boolexpr64;
bool mu__boolexpr65;
bool mu__boolexpr66;
bool mu__boolexpr67;
bool mu__boolexpr68;
bool mu__boolexpr69;
  if (!((mu_src) != (mu_Home))) mu__boolexpr69 = FALSE ;
  else {
  mu__boolexpr69 = ((mu_Sta.mu_UniMsg[mu_src].mu_Cmd) == (mu_UNI_GetX)) ; 
}
  if (!(mu__boolexpr69)) mu__boolexpr68 = FALSE ;
  else {
  mu__boolexpr68 = ((mu_Sta.mu_UniMsg[mu_src].mu_Proc) == (mu_Home)) ; 
}
  if (!(mu__boolexpr68)) mu__boolexpr67 = FALSE ;
  else {
  mu__boolexpr67 = (!(mu_Sta.mu_Dir.mu_Pending)) ; 
}
  if (!(mu__boolexpr67)) mu__boolexpr66 = FALSE ;
  else {
  mu__boolexpr66 = (mu_Sta.mu_Dir.mu_Dirty) ; 
}
  if (!(mu__boolexpr66)) mu__boolexpr65 = FALSE ;
  else {
  mu__boolexpr65 = (!(mu_Sta.mu_Dir.mu_Local)) ; 
}
  if (!(mu__boolexpr65)) mu__boolexpr64 = FALSE ;
  else {
  mu__boolexpr64 = ((mu_Sta.mu_Dir.mu_HeadPtr) != (mu_src)) ; 
}
    return mu__boolexpr64;
  }

  void NextRule(unsigned & what_rule)
  {
    unsigned r = what_rule - 41;
    static mu_1_NODE mu_src;
    mu_src.value((r % 3) + 1);
    r = r / 3;
    while (what_rule < 44 )
      {
	if ( ( TRUE  ) ) {
bool mu__boolexpr70;
bool mu__boolexpr71;
bool mu__boolexpr72;
bool mu__boolexpr73;
bool mu__boolexpr74;
bool mu__boolexpr75;
  if (!((mu_src) != (mu_Home))) mu__boolexpr75 = FALSE ;
  else {
  mu__boolexpr75 = ((mu_Sta.mu_UniMsg[mu_src].mu_Cmd) == (mu_UNI_GetX)) ; 
}
  if (!(mu__boolexpr75)) mu__boolexpr74 = FALSE ;
  else {
  mu__boolexpr74 = ((mu_Sta.mu_UniMsg[mu_src].mu_Proc) == (mu_Home)) ; 
}
  if (!(mu__boolexpr74)) mu__boolexpr73 = FALSE ;
  else {
  mu__boolexpr73 = (!(mu_Sta.mu_Dir.mu_Pending)) ; 
}
  if (!(mu__boolexpr73)) mu__boolexpr72 = FALSE ;
  else {
  mu__boolexpr72 = (mu_Sta.mu_Dir.mu_Dirty) ; 
}
  if (!(mu__boolexpr72)) mu__boolexpr71 = FALSE ;
  else {
  mu__boolexpr71 = (!(mu_Sta.mu_Dir.mu_Local)) ; 
}
  if (!(mu__boolexpr71)) mu__boolexpr70 = FALSE ;
  else {
  mu__boolexpr70 = ((mu_Sta.mu_Dir.mu_HeadPtr) != (mu_src)) ; 
}
	      if (mu__boolexpr70) {
		if ( ( TRUE  ) )
		  return;
		else
		  what_rule++;
	      }
	      else
		what_rule += 1;
	}
	else
	  what_rule += 1;
    r = what_rule - 41;
    mu_src.value((r % 3) + 1);
    r = r / 3;
    }
  }

  void Code(unsigned r)
  {
    static mu_1_NODE mu_src;
    mu_src.value((r % 3) + 1);
    r = r / 3;
/*** Variable declaration ***/
mu_1_STATE mu_NxtSta("NxtSta",0);

mu_NxtSta = mu_Sta;
mu_NxtSta.mu_Dir.mu_Pending = mu_true;
mu_NxtSta.mu_UniMsg[mu_src].mu_Cmd = mu_UNI_GetX;
mu_NxtSta.mu_UniMsg[mu_src].mu_Proc = mu_Sta.mu_Dir.mu_HeadPtr;
mu_NxtSta.mu_UniMsg[mu_src].mu_Data.undefine();
if ( (mu_Sta.mu_Dir.mu_HeadPtr) != (mu_Home) )
{
mu_NxtSta.mu_FwdCmd = mu_UNI_GetX;
}
mu_NxtSta.mu_PendReqSrc = mu_src;
mu_NxtSta.mu_PendReqCmd = mu_UNI_GetX;
mu_NxtSta.mu_Collecting = mu_false;
mu_Sta = mu_NxtSta;
  };

};
/******************** RuleBase14 ********************/
class RuleBase14
{
public:
  int Priority()
  {
    return 0;
  }
  char * Name(unsigned r)
  {
    static mu_1_NODE mu_src;
    mu_src.value((r % 3) + 1);
    r = r / 3;
    return tsprintf("NI_Local_GetX_Nak, src:%s", mu_src.Name());
  }
  bool Condition(unsigned r)
  {
    static mu_1_NODE mu_src;
    mu_src.value((r % 3) + 1);
    r = r / 3;
bool mu__boolexpr76;
bool mu__boolexpr77;
bool mu__boolexpr78;
  if (!((mu_src) != (mu_Home))) mu__boolexpr78 = FALSE ;
  else {
  mu__boolexpr78 = ((mu_Sta.mu_UniMsg[mu_src].mu_Cmd) == (mu_UNI_GetX)) ; 
}
  if (!(mu__boolexpr78)) mu__boolexpr77 = FALSE ;
  else {
  mu__boolexpr77 = ((mu_Sta.mu_UniMsg[mu_src].mu_Proc) == (mu_Home)) ; 
}
  if (!(mu__boolexpr77)) mu__boolexpr76 = FALSE ;
  else {
bool mu__boolexpr79;
bool mu__boolexpr80;
  if (mu_Sta.mu_Dir.mu_Pending) mu__boolexpr80 = TRUE ;
  else {
bool mu__boolexpr81;
bool mu__boolexpr82;
  if (!(mu_Sta.mu_Dir.mu_Dirty)) mu__boolexpr82 = FALSE ;
  else {
  mu__boolexpr82 = (mu_Sta.mu_Dir.mu_Local) ; 
}
  if (!(mu__boolexpr82)) mu__boolexpr81 = FALSE ;
  else {
  mu__boolexpr81 = ((mu_Sta.mu_Proc[mu_Home].mu_CacheState) != (mu_CACHE_E)) ; 
}
  mu__boolexpr80 = (mu__boolexpr81) ; 
}
  if (mu__boolexpr80) mu__boolexpr79 = TRUE ;
  else {
bool mu__boolexpr83;
bool mu__boolexpr84;
  if (!(mu_Sta.mu_Dir.mu_Dirty)) mu__boolexpr84 = FALSE ;
  else {
  mu__boolexpr84 = (!(mu_Sta.mu_Dir.mu_Local)) ; 
}
  if (!(mu__boolexpr84)) mu__boolexpr83 = FALSE ;
  else {
  mu__boolexpr83 = ((mu_Sta.mu_Dir.mu_HeadPtr) == (mu_src)) ; 
}
  mu__boolexpr79 = (mu__boolexpr83) ; 
}
  mu__boolexpr76 = (mu__boolexpr79) ; 
}
    return mu__boolexpr76;
  }

  void NextRule(unsigned & what_rule)
  {
    unsigned r = what_rule - 44;
    static mu_1_NODE mu_src;
    mu_src.value((r % 3) + 1);
    r = r / 3;
    while (what_rule < 47 )
      {
	if ( ( TRUE  ) ) {
bool mu__boolexpr85;
bool mu__boolexpr86;
bool mu__boolexpr87;
  if (!((mu_src) != (mu_Home))) mu__boolexpr87 = FALSE ;
  else {
  mu__boolexpr87 = ((mu_Sta.mu_UniMsg[mu_src].mu_Cmd) == (mu_UNI_GetX)) ; 
}
  if (!(mu__boolexpr87)) mu__boolexpr86 = FALSE ;
  else {
  mu__boolexpr86 = ((mu_Sta.mu_UniMsg[mu_src].mu_Proc) == (mu_Home)) ; 
}
  if (!(mu__boolexpr86)) mu__boolexpr85 = FALSE ;
  else {
bool mu__boolexpr88;
bool mu__boolexpr89;
  if (mu_Sta.mu_Dir.mu_Pending) mu__boolexpr89 = TRUE ;
  else {
bool mu__boolexpr90;
bool mu__boolexpr91;
  if (!(mu_Sta.mu_Dir.mu_Dirty)) mu__boolexpr91 = FALSE ;
  else {
  mu__boolexpr91 = (mu_Sta.mu_Dir.mu_Local) ; 
}
  if (!(mu__boolexpr91)) mu__boolexpr90 = FALSE ;
  else {
  mu__boolexpr90 = ((mu_Sta.mu_Proc[mu_Home].mu_CacheState) != (mu_CACHE_E)) ; 
}
  mu__boolexpr89 = (mu__boolexpr90) ; 
}
  if (mu__boolexpr89) mu__boolexpr88 = TRUE ;
  else {
bool mu__boolexpr92;
bool mu__boolexpr93;
  if (!(mu_Sta.mu_Dir.mu_Dirty)) mu__boolexpr93 = FALSE ;
  else {
  mu__boolexpr93 = (!(mu_Sta.mu_Dir.mu_Local)) ; 
}
  if (!(mu__boolexpr93)) mu__boolexpr92 = FALSE ;
  else {
  mu__boolexpr92 = ((mu_Sta.mu_Dir.mu_HeadPtr) == (mu_src)) ; 
}
  mu__boolexpr88 = (mu__boolexpr92) ; 
}
  mu__boolexpr85 = (mu__boolexpr88) ; 
}
	      if (mu__boolexpr85) {
		if ( ( TRUE  ) )
		  return;
		else
		  what_rule++;
	      }
	      else
		what_rule += 1;
	}
	else
	  what_rule += 1;
    r = what_rule - 44;
    mu_src.value((r % 3) + 1);
    r = r / 3;
    }
  }

  void Code(unsigned r)
  {
    static mu_1_NODE mu_src;
    mu_src.value((r % 3) + 1);
    r = r / 3;
/*** Variable declaration ***/
mu_1_STATE mu_NxtSta("NxtSta",0);

mu_NxtSta = mu_Sta;
mu_NxtSta.mu_UniMsg[mu_src].mu_Cmd = mu_UNI_Nak;
if (mu_Home.isundefined())
  mu_NxtSta.mu_UniMsg[mu_src].mu_Proc.undefine();
else
  mu_NxtSta.mu_UniMsg[mu_src].mu_Proc = mu_Home;
mu_NxtSta.mu_UniMsg[mu_src].mu_Data.undefine();
mu_Sta = mu_NxtSta;
  };

};
/******************** RuleBase15 ********************/
class RuleBase15
{
public:
  int Priority()
  {
    return 0;
  }
  char * Name(unsigned r)
  {
    static mu_1_NODE mu_dst;
    mu_dst.value((r % 3) + 1);
    r = r / 3;
    static mu_1_NODE mu_src;
    mu_src.value((r % 3) + 1);
    r = r / 3;
    return tsprintf("NI_Remote_Get_Put, dst:%s, src:%s", mu_dst.Name(), mu_src.Name());
  }
  bool Condition(unsigned r)
  {
    static mu_1_NODE mu_dst;
    mu_dst.value((r % 3) + 1);
    r = r / 3;
    static mu_1_NODE mu_src;
    mu_src.value((r % 3) + 1);
    r = r / 3;
bool mu__boolexpr94;
bool mu__boolexpr95;
bool mu__boolexpr96;
bool mu__boolexpr97;
  if (!((mu_src) != (mu_dst))) mu__boolexpr97 = FALSE ;
  else {
  mu__boolexpr97 = ((mu_dst) != (mu_Home)) ; 
}
  if (!(mu__boolexpr97)) mu__boolexpr96 = FALSE ;
  else {
  mu__boolexpr96 = ((mu_Sta.mu_UniMsg[mu_src].mu_Cmd) == (mu_UNI_Get)) ; 
}
  if (!(mu__boolexpr96)) mu__boolexpr95 = FALSE ;
  else {
  mu__boolexpr95 = ((mu_Sta.mu_UniMsg[mu_src].mu_Proc) == (mu_dst)) ; 
}
  if (!(mu__boolexpr95)) mu__boolexpr94 = FALSE ;
  else {
  mu__boolexpr94 = ((mu_Sta.mu_Proc[mu_dst].mu_CacheState) == (mu_CACHE_E)) ; 
}
    return mu__boolexpr94;
  }

  void NextRule(unsigned & what_rule)
  {
    unsigned r = what_rule - 47;
    static mu_1_NODE mu_dst;
    mu_dst.value((r % 3) + 1);
    r = r / 3;
    static mu_1_NODE mu_src;
    mu_src.value((r % 3) + 1);
    r = r / 3;
    while (what_rule < 56 )
      {
	if ( ( TRUE  ) ) {
bool mu__boolexpr98;
bool mu__boolexpr99;
bool mu__boolexpr100;
bool mu__boolexpr101;
  if (!((mu_src) != (mu_dst))) mu__boolexpr101 = FALSE ;
  else {
  mu__boolexpr101 = ((mu_dst) != (mu_Home)) ; 
}
  if (!(mu__boolexpr101)) mu__boolexpr100 = FALSE ;
  else {
  mu__boolexpr100 = ((mu_Sta.mu_UniMsg[mu_src].mu_Cmd) == (mu_UNI_Get)) ; 
}
  if (!(mu__boolexpr100)) mu__boolexpr99 = FALSE ;
  else {
  mu__boolexpr99 = ((mu_Sta.mu_UniMsg[mu_src].mu_Proc) == (mu_dst)) ; 
}
  if (!(mu__boolexpr99)) mu__boolexpr98 = FALSE ;
  else {
  mu__boolexpr98 = ((mu_Sta.mu_Proc[mu_dst].mu_CacheState) == (mu_CACHE_E)) ; 
}
	      if (mu__boolexpr98) {
		if ( ( TRUE  ) )
		  return;
		else
		  what_rule++;
	      }
	      else
		what_rule += 1;
	}
	else
	  what_rule += 1;
    r = what_rule - 47;
    mu_dst.value((r % 3) + 1);
    r = r / 3;
    mu_src.value((r % 3) + 1);
    r = r / 3;
    }
  }

  void Code(unsigned r)
  {
    static mu_1_NODE mu_dst;
    mu_dst.value((r % 3) + 1);
    r = r / 3;
    static mu_1_NODE mu_src;
    mu_src.value((r % 3) + 1);
    r = r / 3;
/*** Variable declaration ***/
mu_1_STATE mu_NxtSta("NxtSta",0);

mu_NxtSta = mu_Sta;
mu_NxtSta.mu_Proc[mu_dst].mu_CacheState = mu_CACHE_S;
mu_NxtSta.mu_UniMsg[mu_src].mu_Cmd = mu_UNI_Put;
mu_NxtSta.mu_UniMsg[mu_src].mu_Proc = mu_dst;
mu_NxtSta.mu_UniMsg[mu_src].mu_Data = mu_Sta.mu_Proc[mu_dst].mu_CacheData;
if ( (mu_src) != (mu_Home) )
{
mu_NxtSta.mu_ShWbMsg.mu_Cmd = mu_SHWB_ShWb;
mu_NxtSta.mu_ShWbMsg.mu_Proc = mu_src;
mu_NxtSta.mu_ShWbMsg.mu_Data = mu_Sta.mu_Proc[mu_dst].mu_CacheData;
}
mu_NxtSta.mu_FwdCmd = mu_UNI_None;
mu_NxtSta.mu_FwdSrc = mu_src;
mu_Sta = mu_NxtSta;
  };

};
/******************** RuleBase16 ********************/
class RuleBase16
{
public:
  int Priority()
  {
    return 0;
  }
  char * Name(unsigned r)
  {
    static mu_1_NODE mu_dst;
    mu_dst.value((r % 3) + 1);
    r = r / 3;
    static mu_1_NODE mu_src;
    mu_src.value((r % 3) + 1);
    r = r / 3;
    return tsprintf("NI_Remote_Get_Nak, dst:%s, src:%s", mu_dst.Name(), mu_src.Name());
  }
  bool Condition(unsigned r)
  {
    static mu_1_NODE mu_dst;
    mu_dst.value((r % 3) + 1);
    r = r / 3;
    static mu_1_NODE mu_src;
    mu_src.value((r % 3) + 1);
    r = r / 3;
bool mu__boolexpr102;
bool mu__boolexpr103;
bool mu__boolexpr104;
bool mu__boolexpr105;
  if (!((mu_src) != (mu_dst))) mu__boolexpr105 = FALSE ;
  else {
  mu__boolexpr105 = ((mu_dst) != (mu_Home)) ; 
}
  if (!(mu__boolexpr105)) mu__boolexpr104 = FALSE ;
  else {
  mu__boolexpr104 = ((mu_Sta.mu_UniMsg[mu_src].mu_Cmd) == (mu_UNI_Get)) ; 
}
  if (!(mu__boolexpr104)) mu__boolexpr103 = FALSE ;
  else {
  mu__boolexpr103 = ((mu_Sta.mu_UniMsg[mu_src].mu_Proc) == (mu_dst)) ; 
}
  if (!(mu__boolexpr103)) mu__boolexpr102 = FALSE ;
  else {
  mu__boolexpr102 = ((mu_Sta.mu_Proc[mu_dst].mu_CacheState) != (mu_CACHE_E)) ; 
}
    return mu__boolexpr102;
  }

  void NextRule(unsigned & what_rule)
  {
    unsigned r = what_rule - 56;
    static mu_1_NODE mu_dst;
    mu_dst.value((r % 3) + 1);
    r = r / 3;
    static mu_1_NODE mu_src;
    mu_src.value((r % 3) + 1);
    r = r / 3;
    while (what_rule < 65 )
      {
	if ( ( TRUE  ) ) {
bool mu__boolexpr106;
bool mu__boolexpr107;
bool mu__boolexpr108;
bool mu__boolexpr109;
  if (!((mu_src) != (mu_dst))) mu__boolexpr109 = FALSE ;
  else {
  mu__boolexpr109 = ((mu_dst) != (mu_Home)) ; 
}
  if (!(mu__boolexpr109)) mu__boolexpr108 = FALSE ;
  else {
  mu__boolexpr108 = ((mu_Sta.mu_UniMsg[mu_src].mu_Cmd) == (mu_UNI_Get)) ; 
}
  if (!(mu__boolexpr108)) mu__boolexpr107 = FALSE ;
  else {
  mu__boolexpr107 = ((mu_Sta.mu_UniMsg[mu_src].mu_Proc) == (mu_dst)) ; 
}
  if (!(mu__boolexpr107)) mu__boolexpr106 = FALSE ;
  else {
  mu__boolexpr106 = ((mu_Sta.mu_Proc[mu_dst].mu_CacheState) != (mu_CACHE_E)) ; 
}
	      if (mu__boolexpr106) {
		if ( ( TRUE  ) )
		  return;
		else
		  what_rule++;
	      }
	      else
		what_rule += 1;
	}
	else
	  what_rule += 1;
    r = what_rule - 56;
    mu_dst.value((r % 3) + 1);
    r = r / 3;
    mu_src.value((r % 3) + 1);
    r = r / 3;
    }
  }

  void Code(unsigned r)
  {
    static mu_1_NODE mu_dst;
    mu_dst.value((r % 3) + 1);
    r = r / 3;
    static mu_1_NODE mu_src;
    mu_src.value((r % 3) + 1);
    r = r / 3;
/*** Variable declaration ***/
mu_1_STATE mu_NxtSta("NxtSta",0);

mu_NxtSta = mu_Sta;
mu_NxtSta.mu_UniMsg[mu_src].mu_Cmd = mu_UNI_Nak;
mu_NxtSta.mu_UniMsg[mu_src].mu_Proc = mu_dst;
mu_NxtSta.mu_UniMsg[mu_src].mu_Data.undefine();
mu_NxtSta.mu_NakcMsg.mu_Cmd = mu_NAKC_Nakc;
mu_NxtSta.mu_FwdCmd = mu_UNI_None;
mu_NxtSta.mu_FwdSrc = mu_src;
mu_Sta = mu_NxtSta;
  };

};
/******************** RuleBase17 ********************/
class RuleBase17
{
public:
  int Priority()
  {
    return 0;
  }
  char * Name(unsigned r)
  {
    static mu_1_NODE mu_src;
    mu_src.value((r % 3) + 1);
    r = r / 3;
    return tsprintf("NI_Local_Get_Put, src:%s", mu_src.Name());
  }
  bool Condition(unsigned r)
  {
    static mu_1_NODE mu_src;
    mu_src.value((r % 3) + 1);
    r = r / 3;
bool mu__boolexpr110;
bool mu__boolexpr111;
bool mu__boolexpr112;
bool mu__boolexpr113;
bool mu__boolexpr114;
  if (!((mu_src) != (mu_Home))) mu__boolexpr114 = FALSE ;
  else {
  mu__boolexpr114 = ((mu_Sta.mu_UniMsg[mu_src].mu_Cmd) == (mu_UNI_Get)) ; 
}
  if (!(mu__boolexpr114)) mu__boolexpr113 = FALSE ;
  else {
  mu__boolexpr113 = ((mu_Sta.mu_UniMsg[mu_src].mu_Proc) == (mu_Home)) ; 
}
  if (!(mu__boolexpr113)) mu__boolexpr112 = FALSE ;
  else {
  mu__boolexpr112 = ((mu_Sta.mu_RpMsg[mu_src].mu_Cmd) != (mu_RP_Replace)) ; 
}
  if (!(mu__boolexpr112)) mu__boolexpr111 = FALSE ;
  else {
  mu__boolexpr111 = (!(mu_Sta.mu_Dir.mu_Pending)) ; 
}
  if (!(mu__boolexpr111)) mu__boolexpr110 = FALSE ;
  else {
bool mu__boolexpr115;
  if (!(mu_Sta.mu_Dir.mu_Dirty)) mu__boolexpr115 = TRUE ;
  else {
bool mu__boolexpr116;
  if (!(mu_Sta.mu_Dir.mu_Local)) mu__boolexpr116 = FALSE ;
  else {
  mu__boolexpr116 = ((mu_Sta.mu_Proc[mu_Home].mu_CacheState) == (mu_CACHE_E)) ; 
}
  mu__boolexpr115 = (mu__boolexpr116) ; 
}
  mu__boolexpr110 = (mu__boolexpr115) ; 
}
    return mu__boolexpr110;
  }

  void NextRule(unsigned & what_rule)
  {
    unsigned r = what_rule - 65;
    static mu_1_NODE mu_src;
    mu_src.value((r % 3) + 1);
    r = r / 3;
    while (what_rule < 68 )
      {
	if ( ( TRUE  ) ) {
bool mu__boolexpr117;
bool mu__boolexpr118;
bool mu__boolexpr119;
bool mu__boolexpr120;
bool mu__boolexpr121;
  if (!((mu_src) != (mu_Home))) mu__boolexpr121 = FALSE ;
  else {
  mu__boolexpr121 = ((mu_Sta.mu_UniMsg[mu_src].mu_Cmd) == (mu_UNI_Get)) ; 
}
  if (!(mu__boolexpr121)) mu__boolexpr120 = FALSE ;
  else {
  mu__boolexpr120 = ((mu_Sta.mu_UniMsg[mu_src].mu_Proc) == (mu_Home)) ; 
}
  if (!(mu__boolexpr120)) mu__boolexpr119 = FALSE ;
  else {
  mu__boolexpr119 = ((mu_Sta.mu_RpMsg[mu_src].mu_Cmd) != (mu_RP_Replace)) ; 
}
  if (!(mu__boolexpr119)) mu__boolexpr118 = FALSE ;
  else {
  mu__boolexpr118 = (!(mu_Sta.mu_Dir.mu_Pending)) ; 
}
  if (!(mu__boolexpr118)) mu__boolexpr117 = FALSE ;
  else {
bool mu__boolexpr122;
  if (!(mu_Sta.mu_Dir.mu_Dirty)) mu__boolexpr122 = TRUE ;
  else {
bool mu__boolexpr123;
  if (!(mu_Sta.mu_Dir.mu_Local)) mu__boolexpr123 = FALSE ;
  else {
  mu__boolexpr123 = ((mu_Sta.mu_Proc[mu_Home].mu_CacheState) == (mu_CACHE_E)) ; 
}
  mu__boolexpr122 = (mu__boolexpr123) ; 
}
  mu__boolexpr117 = (mu__boolexpr122) ; 
}
	      if (mu__boolexpr117) {
		if ( ( TRUE  ) )
		  return;
		else
		  what_rule++;
	      }
	      else
		what_rule += 1;
	}
	else
	  what_rule += 1;
    r = what_rule - 65;
    mu_src.value((r % 3) + 1);
    r = r / 3;
    }
  }

  void Code(unsigned r)
  {
    static mu_1_NODE mu_src;
    mu_src.value((r % 3) + 1);
    r = r / 3;
/*** Variable declaration ***/
mu_1_STATE mu_NxtSta("NxtSta",0);

mu_NxtSta = mu_Sta;
if ( mu_Sta.mu_Dir.mu_Dirty )
{
mu_NxtSta.mu_Dir.mu_Dirty = mu_false;
mu_NxtSta.mu_Dir.mu_HeadVld = mu_true;
mu_NxtSta.mu_Dir.mu_HeadPtr = mu_src;
mu_NxtSta.mu_MemData = mu_Sta.mu_Proc[mu_Home].mu_CacheData;
mu_NxtSta.mu_Proc[mu_Home].mu_CacheState = mu_CACHE_S;
mu_NxtSta.mu_UniMsg[mu_src].mu_Cmd = mu_UNI_Put;
if (mu_Home.isundefined())
  mu_NxtSta.mu_UniMsg[mu_src].mu_Proc.undefine();
else
  mu_NxtSta.mu_UniMsg[mu_src].mu_Proc = mu_Home;
mu_NxtSta.mu_UniMsg[mu_src].mu_Data = mu_Sta.mu_Proc[mu_Home].mu_CacheData;
}
else
{
if ( mu_Sta.mu_Dir.mu_HeadVld )
{
mu_NxtSta.mu_Dir.mu_ShrVld = mu_true;
mu_NxtSta.mu_Dir.mu_ShrSet[mu_src] = mu_true;
{
for(int mu_p = 1; mu_p <= 3; mu_p++) {
bool mu__boolexpr124;
  if ((mu_p) == (mu_src)) mu__boolexpr124 = TRUE ;
  else {
  mu__boolexpr124 = (mu_Sta.mu_Dir.mu_ShrSet[mu_p]) ; 
}
mu_NxtSta.mu_Dir.mu_InvSet[mu_p] = mu__boolexpr124;
};
};
}
else
{
mu_NxtSta.mu_Dir.mu_HeadVld = mu_true;
mu_NxtSta.mu_Dir.mu_HeadPtr = mu_src;
}
mu_NxtSta.mu_UniMsg[mu_src].mu_Cmd = mu_UNI_Put;
if (mu_Home.isundefined())
  mu_NxtSta.mu_UniMsg[mu_src].mu_Proc.undefine();
else
  mu_NxtSta.mu_UniMsg[mu_src].mu_Proc = mu_Home;
mu_NxtSta.mu_UniMsg[mu_src].mu_Data = mu_Sta.mu_MemData;
}
mu_Sta = mu_NxtSta;
  };

};
/******************** RuleBase18 ********************/
class RuleBase18
{
public:
  int Priority()
  {
    return 0;
  }
  char * Name(unsigned r)
  {
    static mu_1_NODE mu_src;
    mu_src.value((r % 3) + 1);
    r = r / 3;
    return tsprintf("NI_Local_Get_Get, src:%s", mu_src.Name());
  }
  bool Condition(unsigned r)
  {
    static mu_1_NODE mu_src;
    mu_src.value((r % 3) + 1);
    r = r / 3;
bool mu__boolexpr125;
bool mu__boolexpr126;
bool mu__boolexpr127;
bool mu__boolexpr128;
bool mu__boolexpr129;
bool mu__boolexpr130;
bool mu__boolexpr131;
  if (!((mu_src) != (mu_Home))) mu__boolexpr131 = FALSE ;
  else {
  mu__boolexpr131 = ((mu_Sta.mu_UniMsg[mu_src].mu_Cmd) == (mu_UNI_Get)) ; 
}
  if (!(mu__boolexpr131)) mu__boolexpr130 = FALSE ;
  else {
  mu__boolexpr130 = ((mu_Sta.mu_UniMsg[mu_src].mu_Proc) == (mu_Home)) ; 
}
  if (!(mu__boolexpr130)) mu__boolexpr129 = FALSE ;
  else {
  mu__boolexpr129 = ((mu_Sta.mu_RpMsg[mu_src].mu_Cmd) != (mu_RP_Replace)) ; 
}
  if (!(mu__boolexpr129)) mu__boolexpr128 = FALSE ;
  else {
  mu__boolexpr128 = (!(mu_Sta.mu_Dir.mu_Pending)) ; 
}
  if (!(mu__boolexpr128)) mu__boolexpr127 = FALSE ;
  else {
  mu__boolexpr127 = (mu_Sta.mu_Dir.mu_Dirty) ; 
}
  if (!(mu__boolexpr127)) mu__boolexpr126 = FALSE ;
  else {
  mu__boolexpr126 = (!(mu_Sta.mu_Dir.mu_Local)) ; 
}
  if (!(mu__boolexpr126)) mu__boolexpr125 = FALSE ;
  else {
  mu__boolexpr125 = ((mu_Sta.mu_Dir.mu_HeadPtr) != (mu_src)) ; 
}
    return mu__boolexpr125;
  }

  void NextRule(unsigned & what_rule)
  {
    unsigned r = what_rule - 68;
    static mu_1_NODE mu_src;
    mu_src.value((r % 3) + 1);
    r = r / 3;
    while (what_rule < 71 )
      {
	if ( ( TRUE  ) ) {
bool mu__boolexpr132;
bool mu__boolexpr133;
bool mu__boolexpr134;
bool mu__boolexpr135;
bool mu__boolexpr136;
bool mu__boolexpr137;
bool mu__boolexpr138;
  if (!((mu_src) != (mu_Home))) mu__boolexpr138 = FALSE ;
  else {
  mu__boolexpr138 = ((mu_Sta.mu_UniMsg[mu_src].mu_Cmd) == (mu_UNI_Get)) ; 
}
  if (!(mu__boolexpr138)) mu__boolexpr137 = FALSE ;
  else {
  mu__boolexpr137 = ((mu_Sta.mu_UniMsg[mu_src].mu_Proc) == (mu_Home)) ; 
}
  if (!(mu__boolexpr137)) mu__boolexpr136 = FALSE ;
  else {
  mu__boolexpr136 = ((mu_Sta.mu_RpMsg[mu_src].mu_Cmd) != (mu_RP_Replace)) ; 
}
  if (!(mu__boolexpr136)) mu__boolexpr135 = FALSE ;
  else {
  mu__boolexpr135 = (!(mu_Sta.mu_Dir.mu_Pending)) ; 
}
  if (!(mu__boolexpr135)) mu__boolexpr134 = FALSE ;
  else {
  mu__boolexpr134 = (mu_Sta.mu_Dir.mu_Dirty) ; 
}
  if (!(mu__boolexpr134)) mu__boolexpr133 = FALSE ;
  else {
  mu__boolexpr133 = (!(mu_Sta.mu_Dir.mu_Local)) ; 
}
  if (!(mu__boolexpr133)) mu__boolexpr132 = FALSE ;
  else {
  mu__boolexpr132 = ((mu_Sta.mu_Dir.mu_HeadPtr) != (mu_src)) ; 
}
	      if (mu__boolexpr132) {
		if ( ( TRUE  ) )
		  return;
		else
		  what_rule++;
	      }
	      else
		what_rule += 1;
	}
	else
	  what_rule += 1;
    r = what_rule - 68;
    mu_src.value((r % 3) + 1);
    r = r / 3;
    }
  }

  void Code(unsigned r)
  {
    static mu_1_NODE mu_src;
    mu_src.value((r % 3) + 1);
    r = r / 3;
/*** Variable declaration ***/
mu_1_STATE mu_NxtSta("NxtSta",0);

mu_NxtSta = mu_Sta;
mu_NxtSta.mu_Dir.mu_Pending = mu_true;
mu_NxtSta.mu_UniMsg[mu_src].mu_Cmd = mu_UNI_Get;
mu_NxtSta.mu_UniMsg[mu_src].mu_Proc = mu_Sta.mu_Dir.mu_HeadPtr;
mu_NxtSta.mu_UniMsg[mu_src].mu_Data.undefine();
if ( (mu_Sta.mu_Dir.mu_HeadPtr) != (mu_Home) )
{
mu_NxtSta.mu_FwdCmd = mu_UNI_Get;
}
mu_NxtSta.mu_PendReqSrc = mu_src;
mu_NxtSta.mu_PendReqCmd = mu_UNI_Get;
mu_NxtSta.mu_Collecting = mu_false;
mu_Sta = mu_NxtSta;
  };

};
/******************** RuleBase19 ********************/
class RuleBase19
{
public:
  int Priority()
  {
    return 0;
  }
  char * Name(unsigned r)
  {
    static mu_1_NODE mu_src;
    mu_src.value((r % 3) + 1);
    r = r / 3;
    return tsprintf("NI_Local_Get_Nak, src:%s", mu_src.Name());
  }
  bool Condition(unsigned r)
  {
    static mu_1_NODE mu_src;
    mu_src.value((r % 3) + 1);
    r = r / 3;
bool mu__boolexpr139;
bool mu__boolexpr140;
bool mu__boolexpr141;
bool mu__boolexpr142;
  if (!((mu_src) != (mu_Home))) mu__boolexpr142 = FALSE ;
  else {
  mu__boolexpr142 = ((mu_Sta.mu_UniMsg[mu_src].mu_Cmd) == (mu_UNI_Get)) ; 
}
  if (!(mu__boolexpr142)) mu__boolexpr141 = FALSE ;
  else {
  mu__boolexpr141 = ((mu_Sta.mu_UniMsg[mu_src].mu_Proc) == (mu_Home)) ; 
}
  if (!(mu__boolexpr141)) mu__boolexpr140 = FALSE ;
  else {
  mu__boolexpr140 = ((mu_Sta.mu_RpMsg[mu_src].mu_Cmd) != (mu_RP_Replace)) ; 
}
  if (!(mu__boolexpr140)) mu__boolexpr139 = FALSE ;
  else {
bool mu__boolexpr143;
bool mu__boolexpr144;
  if (mu_Sta.mu_Dir.mu_Pending) mu__boolexpr144 = TRUE ;
  else {
bool mu__boolexpr145;
bool mu__boolexpr146;
  if (!(mu_Sta.mu_Dir.mu_Dirty)) mu__boolexpr146 = FALSE ;
  else {
  mu__boolexpr146 = (mu_Sta.mu_Dir.mu_Local) ; 
}
  if (!(mu__boolexpr146)) mu__boolexpr145 = FALSE ;
  else {
  mu__boolexpr145 = ((mu_Sta.mu_Proc[mu_Home].mu_CacheState) != (mu_CACHE_E)) ; 
}
  mu__boolexpr144 = (mu__boolexpr145) ; 
}
  if (mu__boolexpr144) mu__boolexpr143 = TRUE ;
  else {
bool mu__boolexpr147;
bool mu__boolexpr148;
  if (!(mu_Sta.mu_Dir.mu_Dirty)) mu__boolexpr148 = FALSE ;
  else {
  mu__boolexpr148 = (!(mu_Sta.mu_Dir.mu_Local)) ; 
}
  if (!(mu__boolexpr148)) mu__boolexpr147 = FALSE ;
  else {
  mu__boolexpr147 = ((mu_Sta.mu_Dir.mu_HeadPtr) == (mu_src)) ; 
}
  mu__boolexpr143 = (mu__boolexpr147) ; 
}
  mu__boolexpr139 = (mu__boolexpr143) ; 
}
    return mu__boolexpr139;
  }

  void NextRule(unsigned & what_rule)
  {
    unsigned r = what_rule - 71;
    static mu_1_NODE mu_src;
    mu_src.value((r % 3) + 1);
    r = r / 3;
    while (what_rule < 74 )
      {
	if ( ( TRUE  ) ) {
bool mu__boolexpr149;
bool mu__boolexpr150;
bool mu__boolexpr151;
bool mu__boolexpr152;
  if (!((mu_src) != (mu_Home))) mu__boolexpr152 = FALSE ;
  else {
  mu__boolexpr152 = ((mu_Sta.mu_UniMsg[mu_src].mu_Cmd) == (mu_UNI_Get)) ; 
}
  if (!(mu__boolexpr152)) mu__boolexpr151 = FALSE ;
  else {
  mu__boolexpr151 = ((mu_Sta.mu_UniMsg[mu_src].mu_Proc) == (mu_Home)) ; 
}
  if (!(mu__boolexpr151)) mu__boolexpr150 = FALSE ;
  else {
  mu__boolexpr150 = ((mu_Sta.mu_RpMsg[mu_src].mu_Cmd) != (mu_RP_Replace)) ; 
}
  if (!(mu__boolexpr150)) mu__boolexpr149 = FALSE ;
  else {
bool mu__boolexpr153;
bool mu__boolexpr154;
  if (mu_Sta.mu_Dir.mu_Pending) mu__boolexpr154 = TRUE ;
  else {
bool mu__boolexpr155;
bool mu__boolexpr156;
  if (!(mu_Sta.mu_Dir.mu_Dirty)) mu__boolexpr156 = FALSE ;
  else {
  mu__boolexpr156 = (mu_Sta.mu_Dir.mu_Local) ; 
}
  if (!(mu__boolexpr156)) mu__boolexpr155 = FALSE ;
  else {
  mu__boolexpr155 = ((mu_Sta.mu_Proc[mu_Home].mu_CacheState) != (mu_CACHE_E)) ; 
}
  mu__boolexpr154 = (mu__boolexpr155) ; 
}
  if (mu__boolexpr154) mu__boolexpr153 = TRUE ;
  else {
bool mu__boolexpr157;
bool mu__boolexpr158;
  if (!(mu_Sta.mu_Dir.mu_Dirty)) mu__boolexpr158 = FALSE ;
  else {
  mu__boolexpr158 = (!(mu_Sta.mu_Dir.mu_Local)) ; 
}
  if (!(mu__boolexpr158)) mu__boolexpr157 = FALSE ;
  else {
  mu__boolexpr157 = ((mu_Sta.mu_Dir.mu_HeadPtr) == (mu_src)) ; 
}
  mu__boolexpr153 = (mu__boolexpr157) ; 
}
  mu__boolexpr149 = (mu__boolexpr153) ; 
}
	      if (mu__boolexpr149) {
		if ( ( TRUE  ) )
		  return;
		else
		  what_rule++;
	      }
	      else
		what_rule += 1;
	}
	else
	  what_rule += 1;
    r = what_rule - 71;
    mu_src.value((r % 3) + 1);
    r = r / 3;
    }
  }

  void Code(unsigned r)
  {
    static mu_1_NODE mu_src;
    mu_src.value((r % 3) + 1);
    r = r / 3;
/*** Variable declaration ***/
mu_1_STATE mu_NxtSta("NxtSta",0);

mu_NxtSta = mu_Sta;
mu_NxtSta.mu_UniMsg[mu_src].mu_Cmd = mu_UNI_Nak;
if (mu_Home.isundefined())
  mu_NxtSta.mu_UniMsg[mu_src].mu_Proc.undefine();
else
  mu_NxtSta.mu_UniMsg[mu_src].mu_Proc = mu_Home;
mu_NxtSta.mu_UniMsg[mu_src].mu_Data.undefine();
mu_Sta = mu_NxtSta;
  };

};
/******************** RuleBase20 ********************/
class RuleBase20
{
public:
  int Priority()
  {
    return 0;
  }
  char * Name(unsigned r)
  {
    return tsprintf("NI_Nak_Clear");
  }
  bool Condition(unsigned r)
  {
    return (mu_Sta.mu_NakcMsg.mu_Cmd) == (mu_NAKC_Nakc);
  }

  void NextRule(unsigned & what_rule)
  {
    unsigned r = what_rule - 74;
    while (what_rule < 75 )
      {
	if ( ( TRUE  ) ) {
	      if ((mu_Sta.mu_NakcMsg.mu_Cmd) == (mu_NAKC_Nakc)) {
		if ( ( TRUE  ) )
		  return;
		else
		  what_rule++;
	      }
	      else
		what_rule += 1;
	}
	else
	  what_rule += 1;
    r = what_rule - 74;
    }
  }

  void Code(unsigned r)
  {
/*** Variable declaration ***/
mu_1_STATE mu_NxtSta("NxtSta",0);

mu_NxtSta = mu_Sta;
mu_NxtSta.mu_NakcMsg.mu_Cmd = mu_NAKC_None;
mu_NxtSta.mu_Dir.mu_Pending = mu_false;
mu_Sta = mu_NxtSta;
  };

};
/******************** RuleBase21 ********************/
class RuleBase21
{
public:
  int Priority()
  {
    return 0;
  }
  char * Name(unsigned r)
  {
    static mu_1_NODE mu_dst;
    mu_dst.value((r % 3) + 1);
    r = r / 3;
    return tsprintf("NI_Nak, dst:%s", mu_dst.Name());
  }
  bool Condition(unsigned r)
  {
    static mu_1_NODE mu_dst;
    mu_dst.value((r % 3) + 1);
    r = r / 3;
    return (mu_Sta.mu_UniMsg[mu_dst].mu_Cmd) == (mu_UNI_Nak);
  }

  void NextRule(unsigned & what_rule)
  {
    unsigned r = what_rule - 75;
    static mu_1_NODE mu_dst;
    mu_dst.value((r % 3) + 1);
    r = r / 3;
    while (what_rule < 78 )
      {
	if ( ( TRUE  ) ) {
	      if ((mu_Sta.mu_UniMsg[mu_dst].mu_Cmd) == (mu_UNI_Nak)) {
		if ( ( TRUE  ) )
		  return;
		else
		  what_rule++;
	      }
	      else
		what_rule += 1;
	}
	else
	  what_rule += 1;
    r = what_rule - 75;
    mu_dst.value((r % 3) + 1);
    r = r / 3;
    }
  }

  void Code(unsigned r)
  {
    static mu_1_NODE mu_dst;
    mu_dst.value((r % 3) + 1);
    r = r / 3;
/*** Variable declaration ***/
mu_1_STATE mu_NxtSta("NxtSta",0);

mu_NxtSta = mu_Sta;
mu_NxtSta.mu_UniMsg[mu_dst].mu_Cmd = mu_UNI_None;
mu_NxtSta.mu_UniMsg[mu_dst].mu_Proc.undefine();
mu_NxtSta.mu_UniMsg[mu_dst].mu_Data.undefine();
mu_NxtSta.mu_Proc[mu_dst].mu_ProcCmd = mu_NODE_None;
mu_NxtSta.mu_Proc[mu_dst].mu_InvMarked = mu_false;
mu_Sta = mu_NxtSta;
  };

};
/******************** RuleBase22 ********************/
class RuleBase22
{
public:
  int Priority()
  {
    return 0;
  }
  char * Name(unsigned r)
  {
    return tsprintf("PI_Local_Replace");
  }
  bool Condition(unsigned r)
  {
bool mu__boolexpr159;
  if (!((mu_Sta.mu_Proc[mu_Home].mu_ProcCmd) == (mu_NODE_None))) mu__boolexpr159 = FALSE ;
  else {
  mu__boolexpr159 = ((mu_Sta.mu_Proc[mu_Home].mu_CacheState) == (mu_CACHE_S)) ; 
}
    return mu__boolexpr159;
  }

  void NextRule(unsigned & what_rule)
  {
    unsigned r = what_rule - 78;
    while (what_rule < 79 )
      {
	if ( ( TRUE  ) ) {
bool mu__boolexpr160;
  if (!((mu_Sta.mu_Proc[mu_Home].mu_ProcCmd) == (mu_NODE_None))) mu__boolexpr160 = FALSE ;
  else {
  mu__boolexpr160 = ((mu_Sta.mu_Proc[mu_Home].mu_CacheState) == (mu_CACHE_S)) ; 
}
	      if (mu__boolexpr160) {
		if ( ( TRUE  ) )
		  return;
		else
		  what_rule++;
	      }
	      else
		what_rule += 1;
	}
	else
	  what_rule += 1;
    r = what_rule - 78;
    }
  }

  void Code(unsigned r)
  {
/*** Variable declaration ***/
mu_1_STATE mu_NxtSta("NxtSta",0);

mu_NxtSta = mu_Sta;
mu_NxtSta.mu_Dir.mu_Local = mu_false;
mu_NxtSta.mu_Proc[mu_Home].mu_CacheState = mu_CACHE_I;
mu_NxtSta.mu_Proc[mu_Home].mu_CacheData.undefine();
mu_Sta = mu_NxtSta;
  };

};
/******************** RuleBase23 ********************/
class RuleBase23
{
public:
  int Priority()
  {
    return 0;
  }
  char * Name(unsigned r)
  {
    static mu_1_NODE mu_src;
    mu_src.value((r % 3) + 1);
    r = r / 3;
    return tsprintf("PI_Remote_Replace, src:%s", mu_src.Name());
  }
  bool Condition(unsigned r)
  {
    static mu_1_NODE mu_src;
    mu_src.value((r % 3) + 1);
    r = r / 3;
bool mu__boolexpr161;
bool mu__boolexpr162;
  if (!((mu_src) != (mu_Home))) mu__boolexpr162 = FALSE ;
  else {
  mu__boolexpr162 = ((mu_Sta.mu_Proc[mu_src].mu_ProcCmd) == (mu_NODE_None)) ; 
}
  if (!(mu__boolexpr162)) mu__boolexpr161 = FALSE ;
  else {
  mu__boolexpr161 = ((mu_Sta.mu_Proc[mu_src].mu_CacheState) == (mu_CACHE_S)) ; 
}
    return mu__boolexpr161;
  }

  void NextRule(unsigned & what_rule)
  {
    unsigned r = what_rule - 79;
    static mu_1_NODE mu_src;
    mu_src.value((r % 3) + 1);
    r = r / 3;
    while (what_rule < 82 )
      {
	if ( ( TRUE  ) ) {
bool mu__boolexpr163;
bool mu__boolexpr164;
  if (!((mu_src) != (mu_Home))) mu__boolexpr164 = FALSE ;
  else {
  mu__boolexpr164 = ((mu_Sta.mu_Proc[mu_src].mu_ProcCmd) == (mu_NODE_None)) ; 
}
  if (!(mu__boolexpr164)) mu__boolexpr163 = FALSE ;
  else {
  mu__boolexpr163 = ((mu_Sta.mu_Proc[mu_src].mu_CacheState) == (mu_CACHE_S)) ; 
}
	      if (mu__boolexpr163) {
		if ( ( TRUE  ) )
		  return;
		else
		  what_rule++;
	      }
	      else
		what_rule += 1;
	}
	else
	  what_rule += 1;
    r = what_rule - 79;
    mu_src.value((r % 3) + 1);
    r = r / 3;
    }
  }

  void Code(unsigned r)
  {
    static mu_1_NODE mu_src;
    mu_src.value((r % 3) + 1);
    r = r / 3;
/*** Variable declaration ***/
mu_1_STATE mu_NxtSta("NxtSta",0);

mu_NxtSta = mu_Sta;
mu_NxtSta.mu_Proc[mu_src].mu_CacheState = mu_CACHE_I;
mu_NxtSta.mu_Proc[mu_src].mu_CacheData.undefine();
mu_NxtSta.mu_RpMsg[mu_src].mu_Cmd = mu_RP_Replace;
mu_Sta = mu_NxtSta;
  };

};
/******************** RuleBase24 ********************/
class RuleBase24
{
public:
  int Priority()
  {
    return 0;
  }
  char * Name(unsigned r)
  {
    return tsprintf("PI_Local_PutX");
  }
  bool Condition(unsigned r)
  {
bool mu__boolexpr165;
  if (!((mu_Sta.mu_Proc[mu_Home].mu_ProcCmd) == (mu_NODE_None))) mu__boolexpr165 = FALSE ;
  else {
  mu__boolexpr165 = ((mu_Sta.mu_Proc[mu_Home].mu_CacheState) == (mu_CACHE_E)) ; 
}
    return mu__boolexpr165;
  }

  void NextRule(unsigned & what_rule)
  {
    unsigned r = what_rule - 82;
    while (what_rule < 83 )
      {
	if ( ( TRUE  ) ) {
bool mu__boolexpr166;
  if (!((mu_Sta.mu_Proc[mu_Home].mu_ProcCmd) == (mu_NODE_None))) mu__boolexpr166 = FALSE ;
  else {
  mu__boolexpr166 = ((mu_Sta.mu_Proc[mu_Home].mu_CacheState) == (mu_CACHE_E)) ; 
}
	      if (mu__boolexpr166) {
		if ( ( TRUE  ) )
		  return;
		else
		  what_rule++;
	      }
	      else
		what_rule += 1;
	}
	else
	  what_rule += 1;
    r = what_rule - 82;
    }
  }

  void Code(unsigned r)
  {
/*** Variable declaration ***/
mu_1_STATE mu_NxtSta("NxtSta",0);

mu_NxtSta = mu_Sta;
if ( mu_Sta.mu_Dir.mu_Pending )
{
mu_NxtSta.mu_Proc[mu_Home].mu_CacheState = mu_CACHE_I;
mu_NxtSta.mu_Proc[mu_Home].mu_CacheData.undefine();
mu_NxtSta.mu_Dir.mu_Dirty = mu_false;
mu_NxtSta.mu_MemData = mu_Sta.mu_Proc[mu_Home].mu_CacheData;
}
else
{
mu_NxtSta.mu_Proc[mu_Home].mu_CacheState = mu_CACHE_I;
mu_NxtSta.mu_Proc[mu_Home].mu_CacheData.undefine();
mu_NxtSta.mu_Dir.mu_Local = mu_false;
mu_NxtSta.mu_Dir.mu_Dirty = mu_false;
mu_NxtSta.mu_MemData = mu_Sta.mu_Proc[mu_Home].mu_CacheData;
}
mu_Sta = mu_NxtSta;
  };

};
/******************** RuleBase25 ********************/
class RuleBase25
{
public:
  int Priority()
  {
    return 0;
  }
  char * Name(unsigned r)
  {
    static mu_1_NODE mu_dst;
    mu_dst.value((r % 3) + 1);
    r = r / 3;
    return tsprintf("PI_Remote_PutX, dst:%s", mu_dst.Name());
  }
  bool Condition(unsigned r)
  {
    static mu_1_NODE mu_dst;
    mu_dst.value((r % 3) + 1);
    r = r / 3;
bool mu__boolexpr167;
bool mu__boolexpr168;
  if (!((mu_dst) != (mu_Home))) mu__boolexpr168 = FALSE ;
  else {
  mu__boolexpr168 = ((mu_Sta.mu_Proc[mu_dst].mu_ProcCmd) == (mu_NODE_None)) ; 
}
  if (!(mu__boolexpr168)) mu__boolexpr167 = FALSE ;
  else {
  mu__boolexpr167 = ((mu_Sta.mu_Proc[mu_dst].mu_CacheState) == (mu_CACHE_E)) ; 
}
    return mu__boolexpr167;
  }

  void NextRule(unsigned & what_rule)
  {
    unsigned r = what_rule - 83;
    static mu_1_NODE mu_dst;
    mu_dst.value((r % 3) + 1);
    r = r / 3;
    while (what_rule < 86 )
      {
	if ( ( TRUE  ) ) {
bool mu__boolexpr169;
bool mu__boolexpr170;
  if (!((mu_dst) != (mu_Home))) mu__boolexpr170 = FALSE ;
  else {
  mu__boolexpr170 = ((mu_Sta.mu_Proc[mu_dst].mu_ProcCmd) == (mu_NODE_None)) ; 
}
  if (!(mu__boolexpr170)) mu__boolexpr169 = FALSE ;
  else {
  mu__boolexpr169 = ((mu_Sta.mu_Proc[mu_dst].mu_CacheState) == (mu_CACHE_E)) ; 
}
	      if (mu__boolexpr169) {
		if ( ( TRUE  ) )
		  return;
		else
		  what_rule++;
	      }
	      else
		what_rule += 1;
	}
	else
	  what_rule += 1;
    r = what_rule - 83;
    mu_dst.value((r % 3) + 1);
    r = r / 3;
    }
  }

  void Code(unsigned r)
  {
    static mu_1_NODE mu_dst;
    mu_dst.value((r % 3) + 1);
    r = r / 3;
/*** Variable declaration ***/
mu_1_STATE mu_NxtSta("NxtSta",0);

mu_NxtSta = mu_Sta;
mu_NxtSta.mu_Proc[mu_dst].mu_CacheState = mu_CACHE_I;
mu_NxtSta.mu_Proc[mu_dst].mu_CacheData.undefine();
mu_NxtSta.mu_WbMsg.mu_Cmd = mu_WB_Wb;
mu_NxtSta.mu_WbMsg.mu_Proc = mu_dst;
mu_NxtSta.mu_WbMsg.mu_Data = mu_Sta.mu_Proc[mu_dst].mu_CacheData;
mu_Sta = mu_NxtSta;
  };

};
/******************** RuleBase26 ********************/
class RuleBase26
{
public:
  int Priority()
  {
    return 0;
  }
  char * Name(unsigned r)
  {
    return tsprintf("PI_Local_GetX_PutX");
  }
  bool Condition(unsigned r)
  {
bool mu__boolexpr171;
bool mu__boolexpr172;
bool mu__boolexpr173;
  if (!((mu_Sta.mu_Proc[mu_Home].mu_ProcCmd) == (mu_NODE_None))) mu__boolexpr173 = FALSE ;
  else {
bool mu__boolexpr174;
  if ((mu_Sta.mu_Proc[mu_Home].mu_CacheState) == (mu_CACHE_I)) mu__boolexpr174 = TRUE ;
  else {
  mu__boolexpr174 = ((mu_Sta.mu_Proc[mu_Home].mu_CacheState) == (mu_CACHE_S)) ; 
}
  mu__boolexpr173 = (mu__boolexpr174) ; 
}
  if (!(mu__boolexpr173)) mu__boolexpr172 = FALSE ;
  else {
  mu__boolexpr172 = (!(mu_Sta.mu_Dir.mu_Pending)) ; 
}
  if (!(mu__boolexpr172)) mu__boolexpr171 = FALSE ;
  else {
  mu__boolexpr171 = (!(mu_Sta.mu_Dir.mu_Dirty)) ; 
}
    return mu__boolexpr171;
  }

  void NextRule(unsigned & what_rule)
  {
    unsigned r = what_rule - 86;
    while (what_rule < 87 )
      {
	if ( ( TRUE  ) ) {
bool mu__boolexpr175;
bool mu__boolexpr176;
bool mu__boolexpr177;
  if (!((mu_Sta.mu_Proc[mu_Home].mu_ProcCmd) == (mu_NODE_None))) mu__boolexpr177 = FALSE ;
  else {
bool mu__boolexpr178;
  if ((mu_Sta.mu_Proc[mu_Home].mu_CacheState) == (mu_CACHE_I)) mu__boolexpr178 = TRUE ;
  else {
  mu__boolexpr178 = ((mu_Sta.mu_Proc[mu_Home].mu_CacheState) == (mu_CACHE_S)) ; 
}
  mu__boolexpr177 = (mu__boolexpr178) ; 
}
  if (!(mu__boolexpr177)) mu__boolexpr176 = FALSE ;
  else {
  mu__boolexpr176 = (!(mu_Sta.mu_Dir.mu_Pending)) ; 
}
  if (!(mu__boolexpr176)) mu__boolexpr175 = FALSE ;
  else {
  mu__boolexpr175 = (!(mu_Sta.mu_Dir.mu_Dirty)) ; 
}
	      if (mu__boolexpr175) {
		if ( ( TRUE  ) )
		  return;
		else
		  what_rule++;
	      }
	      else
		what_rule += 1;
	}
	else
	  what_rule += 1;
    r = what_rule - 86;
    }
  }

  void Code(unsigned r)
  {
/*** Variable declaration ***/
mu_1_STATE mu_NxtSta("NxtSta",0);

mu_NxtSta = mu_Sta;
mu_NxtSta.mu_Dir.mu_Local = mu_true;
mu_NxtSta.mu_Dir.mu_Dirty = mu_true;
if ( mu_Sta.mu_Dir.mu_HeadVld )
{
mu_NxtSta.mu_Dir.mu_Pending = mu_true;
mu_NxtSta.mu_Dir.mu_HeadVld = mu_false;
mu_NxtSta.mu_Dir.mu_HeadPtr.undefine();
mu_NxtSta.mu_Dir.mu_ShrVld = mu_false;
{
for(int mu_p = 1; mu_p <= 3; mu_p++) {
mu_NxtSta.mu_Dir.mu_ShrSet[mu_p] = mu_false;
bool mu__boolexpr179;
  if (!((mu_p) != (mu_Home))) mu__boolexpr179 = FALSE ;
  else {
bool mu__boolexpr180;
bool mu__boolexpr181;
  if (!(mu_Sta.mu_Dir.mu_ShrVld)) mu__boolexpr181 = FALSE ;
  else {
  mu__boolexpr181 = (mu_Sta.mu_Dir.mu_ShrSet[mu_p]) ; 
}
  if (mu__boolexpr181) mu__boolexpr180 = TRUE ;
  else {
bool mu__boolexpr182;
  if (!(mu_Sta.mu_Dir.mu_HeadVld)) mu__boolexpr182 = FALSE ;
  else {
  mu__boolexpr182 = ((mu_Sta.mu_Dir.mu_HeadPtr) == (mu_p)) ; 
}
  mu__boolexpr180 = (mu__boolexpr182) ; 
}
  mu__boolexpr179 = (mu__boolexpr180) ; 
}
if ( mu__boolexpr179 )
{
mu_NxtSta.mu_Dir.mu_InvSet[mu_p] = mu_true;
mu_NxtSta.mu_InvMsg[mu_p].mu_Cmd = mu_INV_Inv;
}
else
{
mu_NxtSta.mu_Dir.mu_InvSet[mu_p] = mu_false;
mu_NxtSta.mu_InvMsg[mu_p].mu_Cmd = mu_INV_None;
}
};
};
mu_NxtSta.mu_Collecting = mu_true;
mu_NxtSta.mu_PrevData = mu_Sta.mu_CurrData;
mu_NxtSta.mu_LastOtherInvAck = mu_Sta.mu_Dir.mu_HeadPtr;
}
mu_NxtSta.mu_Proc[mu_Home].mu_ProcCmd = mu_NODE_None;
mu_NxtSta.mu_Proc[mu_Home].mu_InvMarked = mu_false;
mu_NxtSta.mu_Proc[mu_Home].mu_CacheState = mu_CACHE_E;
mu_NxtSta.mu_Proc[mu_Home].mu_CacheData = mu_Sta.mu_MemData;
mu_Sta = mu_NxtSta;
  };

};
/******************** RuleBase27 ********************/
class RuleBase27
{
public:
  int Priority()
  {
    return 0;
  }
  char * Name(unsigned r)
  {
    return tsprintf("PI_Local_GetX_GetX");
  }
  bool Condition(unsigned r)
  {
bool mu__boolexpr183;
bool mu__boolexpr184;
bool mu__boolexpr185;
  if (!((mu_Sta.mu_Proc[mu_Home].mu_ProcCmd) == (mu_NODE_None))) mu__boolexpr185 = FALSE ;
  else {
bool mu__boolexpr186;
  if ((mu_Sta.mu_Proc[mu_Home].mu_CacheState) == (mu_CACHE_I)) mu__boolexpr186 = TRUE ;
  else {
  mu__boolexpr186 = ((mu_Sta.mu_Proc[mu_Home].mu_CacheState) == (mu_CACHE_S)) ; 
}
  mu__boolexpr185 = (mu__boolexpr186) ; 
}
  if (!(mu__boolexpr185)) mu__boolexpr184 = FALSE ;
  else {
  mu__boolexpr184 = (!(mu_Sta.mu_Dir.mu_Pending)) ; 
}
  if (!(mu__boolexpr184)) mu__boolexpr183 = FALSE ;
  else {
  mu__boolexpr183 = (mu_Sta.mu_Dir.mu_Dirty) ; 
}
    return mu__boolexpr183;
  }

  void NextRule(unsigned & what_rule)
  {
    unsigned r = what_rule - 87;
    while (what_rule < 88 )
      {
	if ( ( TRUE  ) ) {
bool mu__boolexpr187;
bool mu__boolexpr188;
bool mu__boolexpr189;
  if (!((mu_Sta.mu_Proc[mu_Home].mu_ProcCmd) == (mu_NODE_None))) mu__boolexpr189 = FALSE ;
  else {
bool mu__boolexpr190;
  if ((mu_Sta.mu_Proc[mu_Home].mu_CacheState) == (mu_CACHE_I)) mu__boolexpr190 = TRUE ;
  else {
  mu__boolexpr190 = ((mu_Sta.mu_Proc[mu_Home].mu_CacheState) == (mu_CACHE_S)) ; 
}
  mu__boolexpr189 = (mu__boolexpr190) ; 
}
  if (!(mu__boolexpr189)) mu__boolexpr188 = FALSE ;
  else {
  mu__boolexpr188 = (!(mu_Sta.mu_Dir.mu_Pending)) ; 
}
  if (!(mu__boolexpr188)) mu__boolexpr187 = FALSE ;
  else {
  mu__boolexpr187 = (mu_Sta.mu_Dir.mu_Dirty) ; 
}
	      if (mu__boolexpr187) {
		if ( ( TRUE  ) )
		  return;
		else
		  what_rule++;
	      }
	      else
		what_rule += 1;
	}
	else
	  what_rule += 1;
    r = what_rule - 87;
    }
  }

  void Code(unsigned r)
  {
/*** Variable declaration ***/
mu_1_STATE mu_NxtSta("NxtSta",0);

mu_NxtSta = mu_Sta;
mu_NxtSta.mu_Proc[mu_Home].mu_ProcCmd = mu_NODE_GetX;
mu_NxtSta.mu_Dir.mu_Pending = mu_true;
mu_NxtSta.mu_UniMsg[mu_Home].mu_Cmd = mu_UNI_GetX;
mu_NxtSta.mu_UniMsg[mu_Home].mu_Proc = mu_Sta.mu_Dir.mu_HeadPtr;
mu_NxtSta.mu_UniMsg[mu_Home].mu_Data.undefine();
if ( (mu_Sta.mu_Dir.mu_HeadPtr) != (mu_Home) )
{
mu_NxtSta.mu_FwdCmd = mu_UNI_GetX;
}
if (mu_Home.isundefined())
  mu_NxtSta.mu_PendReqSrc.undefine();
else
  mu_NxtSta.mu_PendReqSrc = mu_Home;
mu_NxtSta.mu_PendReqCmd = mu_UNI_GetX;
mu_NxtSta.mu_Collecting = mu_false;
mu_Sta = mu_NxtSta;
  };

};
/******************** RuleBase28 ********************/
class RuleBase28
{
public:
  int Priority()
  {
    return 0;
  }
  char * Name(unsigned r)
  {
    static mu_1_NODE mu_src;
    mu_src.value((r % 3) + 1);
    r = r / 3;
    return tsprintf("PI_Remote_GetX, src:%s", mu_src.Name());
  }
  bool Condition(unsigned r)
  {
    static mu_1_NODE mu_src;
    mu_src.value((r % 3) + 1);
    r = r / 3;
bool mu__boolexpr191;
bool mu__boolexpr192;
  if (!((mu_src) != (mu_Home))) mu__boolexpr192 = FALSE ;
  else {
  mu__boolexpr192 = ((mu_Sta.mu_Proc[mu_src].mu_ProcCmd) == (mu_NODE_None)) ; 
}
  if (!(mu__boolexpr192)) mu__boolexpr191 = FALSE ;
  else {
  mu__boolexpr191 = ((mu_Sta.mu_Proc[mu_src].mu_CacheState) == (mu_CACHE_I)) ; 
}
    return mu__boolexpr191;
  }

  void NextRule(unsigned & what_rule)
  {
    unsigned r = what_rule - 88;
    static mu_1_NODE mu_src;
    mu_src.value((r % 3) + 1);
    r = r / 3;
    while (what_rule < 91 )
      {
	if ( ( TRUE  ) ) {
bool mu__boolexpr193;
bool mu__boolexpr194;
  if (!((mu_src) != (mu_Home))) mu__boolexpr194 = FALSE ;
  else {
  mu__boolexpr194 = ((mu_Sta.mu_Proc[mu_src].mu_ProcCmd) == (mu_NODE_None)) ; 
}
  if (!(mu__boolexpr194)) mu__boolexpr193 = FALSE ;
  else {
  mu__boolexpr193 = ((mu_Sta.mu_Proc[mu_src].mu_CacheState) == (mu_CACHE_I)) ; 
}
	      if (mu__boolexpr193) {
		if ( ( TRUE  ) )
		  return;
		else
		  what_rule++;
	      }
	      else
		what_rule += 1;
	}
	else
	  what_rule += 1;
    r = what_rule - 88;
    mu_src.value((r % 3) + 1);
    r = r / 3;
    }
  }

  void Code(unsigned r)
  {
    static mu_1_NODE mu_src;
    mu_src.value((r % 3) + 1);
    r = r / 3;
/*** Variable declaration ***/
mu_1_STATE mu_NxtSta("NxtSta",0);

mu_NxtSta = mu_Sta;
mu_NxtSta.mu_Proc[mu_src].mu_ProcCmd = mu_NODE_GetX;
mu_NxtSta.mu_UniMsg[mu_src].mu_Cmd = mu_UNI_GetX;
if (mu_Home.isundefined())
  mu_NxtSta.mu_UniMsg[mu_src].mu_Proc.undefine();
else
  mu_NxtSta.mu_UniMsg[mu_src].mu_Proc = mu_Home;
mu_NxtSta.mu_UniMsg[mu_src].mu_Data.undefine();
mu_Sta = mu_NxtSta;
  };

};
/******************** RuleBase29 ********************/
class RuleBase29
{
public:
  int Priority()
  {
    return 0;
  }
  char * Name(unsigned r)
  {
    return tsprintf("PI_Local_Get_Put");
  }
  bool Condition(unsigned r)
  {
bool mu__boolexpr195;
bool mu__boolexpr196;
bool mu__boolexpr197;
  if (!((mu_Sta.mu_Proc[mu_Home].mu_ProcCmd) == (mu_NODE_None))) mu__boolexpr197 = FALSE ;
  else {
  mu__boolexpr197 = ((mu_Sta.mu_Proc[mu_Home].mu_CacheState) == (mu_CACHE_I)) ; 
}
  if (!(mu__boolexpr197)) mu__boolexpr196 = FALSE ;
  else {
  mu__boolexpr196 = (!(mu_Sta.mu_Dir.mu_Pending)) ; 
}
  if (!(mu__boolexpr196)) mu__boolexpr195 = FALSE ;
  else {
  mu__boolexpr195 = (!(mu_Sta.mu_Dir.mu_Dirty)) ; 
}
    return mu__boolexpr195;
  }

  void NextRule(unsigned & what_rule)
  {
    unsigned r = what_rule - 91;
    while (what_rule < 92 )
      {
	if ( ( TRUE  ) ) {
bool mu__boolexpr198;
bool mu__boolexpr199;
bool mu__boolexpr200;
  if (!((mu_Sta.mu_Proc[mu_Home].mu_ProcCmd) == (mu_NODE_None))) mu__boolexpr200 = FALSE ;
  else {
  mu__boolexpr200 = ((mu_Sta.mu_Proc[mu_Home].mu_CacheState) == (mu_CACHE_I)) ; 
}
  if (!(mu__boolexpr200)) mu__boolexpr199 = FALSE ;
  else {
  mu__boolexpr199 = (!(mu_Sta.mu_Dir.mu_Pending)) ; 
}
  if (!(mu__boolexpr199)) mu__boolexpr198 = FALSE ;
  else {
  mu__boolexpr198 = (!(mu_Sta.mu_Dir.mu_Dirty)) ; 
}
	      if (mu__boolexpr198) {
		if ( ( TRUE  ) )
		  return;
		else
		  what_rule++;
	      }
	      else
		what_rule += 1;
	}
	else
	  what_rule += 1;
    r = what_rule - 91;
    }
  }

  void Code(unsigned r)
  {
/*** Variable declaration ***/
mu_1_STATE mu_NxtSta("NxtSta",0);

mu_NxtSta = mu_Sta;
mu_NxtSta.mu_Dir.mu_Local = mu_true;
mu_NxtSta.mu_Proc[mu_Home].mu_ProcCmd = mu_NODE_None;
if ( mu_Sta.mu_Proc[mu_Home].mu_InvMarked )
{
mu_NxtSta.mu_Proc[mu_Home].mu_InvMarked = mu_false;
mu_NxtSta.mu_Proc[mu_Home].mu_CacheState = mu_CACHE_I;
mu_NxtSta.mu_Proc[mu_Home].mu_CacheData.undefine();
}
else
{
mu_NxtSta.mu_Proc[mu_Home].mu_CacheState = mu_CACHE_S;
mu_NxtSta.mu_Proc[mu_Home].mu_CacheData = mu_Sta.mu_MemData;
}
mu_Sta = mu_NxtSta;
  };

};
/******************** RuleBase30 ********************/
class RuleBase30
{
public:
  int Priority()
  {
    return 0;
  }
  char * Name(unsigned r)
  {
    return tsprintf("PI_Local_Get_Get");
  }
  bool Condition(unsigned r)
  {
bool mu__boolexpr201;
bool mu__boolexpr202;
bool mu__boolexpr203;
  if (!((mu_Sta.mu_Proc[mu_Home].mu_ProcCmd) == (mu_NODE_None))) mu__boolexpr203 = FALSE ;
  else {
  mu__boolexpr203 = ((mu_Sta.mu_Proc[mu_Home].mu_CacheState) == (mu_CACHE_I)) ; 
}
  if (!(mu__boolexpr203)) mu__boolexpr202 = FALSE ;
  else {
  mu__boolexpr202 = (!(mu_Sta.mu_Dir.mu_Pending)) ; 
}
  if (!(mu__boolexpr202)) mu__boolexpr201 = FALSE ;
  else {
  mu__boolexpr201 = (mu_Sta.mu_Dir.mu_Dirty) ; 
}
    return mu__boolexpr201;
  }

  void NextRule(unsigned & what_rule)
  {
    unsigned r = what_rule - 92;
    while (what_rule < 93 )
      {
	if ( ( TRUE  ) ) {
bool mu__boolexpr204;
bool mu__boolexpr205;
bool mu__boolexpr206;
  if (!((mu_Sta.mu_Proc[mu_Home].mu_ProcCmd) == (mu_NODE_None))) mu__boolexpr206 = FALSE ;
  else {
  mu__boolexpr206 = ((mu_Sta.mu_Proc[mu_Home].mu_CacheState) == (mu_CACHE_I)) ; 
}
  if (!(mu__boolexpr206)) mu__boolexpr205 = FALSE ;
  else {
  mu__boolexpr205 = (!(mu_Sta.mu_Dir.mu_Pending)) ; 
}
  if (!(mu__boolexpr205)) mu__boolexpr204 = FALSE ;
  else {
  mu__boolexpr204 = (mu_Sta.mu_Dir.mu_Dirty) ; 
}
	      if (mu__boolexpr204) {
		if ( ( TRUE  ) )
		  return;
		else
		  what_rule++;
	      }
	      else
		what_rule += 1;
	}
	else
	  what_rule += 1;
    r = what_rule - 92;
    }
  }

  void Code(unsigned r)
  {
/*** Variable declaration ***/
mu_1_STATE mu_NxtSta("NxtSta",0);

mu_NxtSta = mu_Sta;
mu_NxtSta.mu_Proc[mu_Home].mu_ProcCmd = mu_NODE_Get;
mu_NxtSta.mu_Dir.mu_Pending = mu_true;
mu_NxtSta.mu_UniMsg[mu_Home].mu_Cmd = mu_UNI_Get;
mu_NxtSta.mu_UniMsg[mu_Home].mu_Proc = mu_Sta.mu_Dir.mu_HeadPtr;
mu_NxtSta.mu_UniMsg[mu_Home].mu_Data.undefine();
if ( (mu_Sta.mu_Dir.mu_HeadPtr) != (mu_Home) )
{
mu_NxtSta.mu_FwdCmd = mu_UNI_Get;
}
if (mu_Home.isundefined())
  mu_NxtSta.mu_PendReqSrc.undefine();
else
  mu_NxtSta.mu_PendReqSrc = mu_Home;
mu_NxtSta.mu_PendReqCmd = mu_UNI_Get;
mu_NxtSta.mu_Collecting = mu_false;
mu_Sta = mu_NxtSta;
  };

};
/******************** RuleBase31 ********************/
class RuleBase31
{
public:
  int Priority()
  {
    return 0;
  }
  char * Name(unsigned r)
  {
    static mu_1_NODE mu_src;
    mu_src.value((r % 3) + 1);
    r = r / 3;
    return tsprintf("PI_Remote_Get, src:%s", mu_src.Name());
  }
  bool Condition(unsigned r)
  {
    static mu_1_NODE mu_src;
    mu_src.value((r % 3) + 1);
    r = r / 3;
bool mu__boolexpr207;
bool mu__boolexpr208;
  if (!((mu_src) != (mu_Home))) mu__boolexpr208 = FALSE ;
  else {
  mu__boolexpr208 = ((mu_Sta.mu_Proc[mu_src].mu_ProcCmd) == (mu_NODE_None)) ; 
}
  if (!(mu__boolexpr208)) mu__boolexpr207 = FALSE ;
  else {
  mu__boolexpr207 = ((mu_Sta.mu_Proc[mu_src].mu_CacheState) == (mu_CACHE_I)) ; 
}
    return mu__boolexpr207;
  }

  void NextRule(unsigned & what_rule)
  {
    unsigned r = what_rule - 93;
    static mu_1_NODE mu_src;
    mu_src.value((r % 3) + 1);
    r = r / 3;
    while (what_rule < 96 )
      {
	if ( ( TRUE  ) ) {
bool mu__boolexpr209;
bool mu__boolexpr210;
  if (!((mu_src) != (mu_Home))) mu__boolexpr210 = FALSE ;
  else {
  mu__boolexpr210 = ((mu_Sta.mu_Proc[mu_src].mu_ProcCmd) == (mu_NODE_None)) ; 
}
  if (!(mu__boolexpr210)) mu__boolexpr209 = FALSE ;
  else {
  mu__boolexpr209 = ((mu_Sta.mu_Proc[mu_src].mu_CacheState) == (mu_CACHE_I)) ; 
}
	      if (mu__boolexpr209) {
		if ( ( TRUE  ) )
		  return;
		else
		  what_rule++;
	      }
	      else
		what_rule += 1;
	}
	else
	  what_rule += 1;
    r = what_rule - 93;
    mu_src.value((r % 3) + 1);
    r = r / 3;
    }
  }

  void Code(unsigned r)
  {
    static mu_1_NODE mu_src;
    mu_src.value((r % 3) + 1);
    r = r / 3;
/*** Variable declaration ***/
mu_1_STATE mu_NxtSta("NxtSta",0);

mu_NxtSta = mu_Sta;
mu_NxtSta.mu_Proc[mu_src].mu_ProcCmd = mu_NODE_Get;
mu_NxtSta.mu_UniMsg[mu_src].mu_Cmd = mu_UNI_Get;
if (mu_Home.isundefined())
  mu_NxtSta.mu_UniMsg[mu_src].mu_Proc.undefine();
else
  mu_NxtSta.mu_UniMsg[mu_src].mu_Proc = mu_Home;
mu_NxtSta.mu_UniMsg[mu_src].mu_Data.undefine();
mu_Sta = mu_NxtSta;
  };

};
/******************** RuleBase32 ********************/
class RuleBase32
{
public:
  int Priority()
  {
    return 0;
  }
  char * Name(unsigned r)
  {
    static mu_1_DATA mu_data;
    mu_data.value((r % 2) + 4);
    r = r / 2;
    static mu_1_NODE mu_src;
    mu_src.value((r % 3) + 1);
    r = r / 3;
    return tsprintf("Store, data:%s, src:%s", mu_data.Name(), mu_src.Name());
  }
  bool Condition(unsigned r)
  {
    static mu_1_DATA mu_data;
    mu_data.value((r % 2) + 4);
    r = r / 2;
    static mu_1_NODE mu_src;
    mu_src.value((r % 3) + 1);
    r = r / 3;
    return (mu_Sta.mu_Proc[mu_src].mu_CacheState) == (mu_CACHE_E);
  }

  void NextRule(unsigned & what_rule)
  {
    unsigned r = what_rule - 96;
    static mu_1_DATA mu_data;
    mu_data.value((r % 2) + 4);
    r = r / 2;
    static mu_1_NODE mu_src;
    mu_src.value((r % 3) + 1);
    r = r / 3;
    while (what_rule < 102 )
      {
	if ( ( TRUE  ) ) {
	      if ((mu_Sta.mu_Proc[mu_src].mu_CacheState) == (mu_CACHE_E)) {
		if ( ( TRUE  ) )
		  return;
		else
		  what_rule++;
	      }
	      else
		what_rule += 2;
	}
	else
	  what_rule += 2;
    r = what_rule - 96;
    mu_data.value((r % 2) + 4);
    r = r / 2;
    mu_src.value((r % 3) + 1);
    r = r / 3;
    }
  }

  void Code(unsigned r)
  {
    static mu_1_DATA mu_data;
    mu_data.value((r % 2) + 4);
    r = r / 2;
    static mu_1_NODE mu_src;
    mu_src.value((r % 3) + 1);
    r = r / 3;
mu_Sta.mu_Proc[mu_src].mu_CacheData = mu_data;
mu_Sta.mu_CurrData = mu_data;
mu_Sta.mu_LastWrVld = mu_true;
mu_Sta.mu_LastWrPtr = mu_src;
  };

};
class NextStateGenerator
{
  RuleBase0 R0;
  RuleBase1 R1;
  RuleBase2 R2;
  RuleBase3 R3;
  RuleBase4 R4;
  RuleBase5 R5;
  RuleBase6 R6;
  RuleBase7 R7;
  RuleBase8 R8;
  RuleBase9 R9;
  RuleBase10 R10;
  RuleBase11 R11;
  RuleBase12 R12;
  RuleBase13 R13;
  RuleBase14 R14;
  RuleBase15 R15;
  RuleBase16 R16;
  RuleBase17 R17;
  RuleBase18 R18;
  RuleBase19 R19;
  RuleBase20 R20;
  RuleBase21 R21;
  RuleBase22 R22;
  RuleBase23 R23;
  RuleBase24 R24;
  RuleBase25 R25;
  RuleBase26 R26;
  RuleBase27 R27;
  RuleBase28 R28;
  RuleBase29 R29;
  RuleBase30 R30;
  RuleBase31 R31;
  RuleBase32 R32;
public:
void SetNextEnabledRule(unsigned & what_rule)
{
  category = CONDITION;
  if (what_rule<3)
    { R0.NextRule(what_rule);
      if (what_rule<3) return; }
  if (what_rule>=3 && what_rule<4)
    { R1.NextRule(what_rule);
      if (what_rule<4) return; }
  if (what_rule>=4 && what_rule<5)
    { R2.NextRule(what_rule);
      if (what_rule<5) return; }
  if (what_rule>=5 && what_rule<6)
    { R3.NextRule(what_rule);
      if (what_rule<6) return; }
  if (what_rule>=6 && what_rule<9)
    { R4.NextRule(what_rule);
      if (what_rule<9) return; }
  if (what_rule>=9 && what_rule<12)
    { R5.NextRule(what_rule);
      if (what_rule<12) return; }
  if (what_rule>=12 && what_rule<15)
    { R6.NextRule(what_rule);
      if (what_rule<15) return; }
  if (what_rule>=15 && what_rule<16)
    { R7.NextRule(what_rule);
      if (what_rule<16) return; }
  if (what_rule>=16 && what_rule<19)
    { R8.NextRule(what_rule);
      if (what_rule<19) return; }
  if (what_rule>=19 && what_rule<20)
    { R9.NextRule(what_rule);
      if (what_rule<20) return; }
  if (what_rule>=20 && what_rule<29)
    { R10.NextRule(what_rule);
      if (what_rule<29) return; }
  if (what_rule>=29 && what_rule<38)
    { R11.NextRule(what_rule);
      if (what_rule<38) return; }
  if (what_rule>=38 && what_rule<41)
    { R12.NextRule(what_rule);
      if (what_rule<41) return; }
  if (what_rule>=41 && what_rule<44)
    { R13.NextRule(what_rule);
      if (what_rule<44) return; }
  if (what_rule>=44 && what_rule<47)
    { R14.NextRule(what_rule);
      if (what_rule<47) return; }
  if (what_rule>=47 && what_rule<56)
    { R15.NextRule(what_rule);
      if (what_rule<56) return; }
  if (what_rule>=56 && what_rule<65)
    { R16.NextRule(what_rule);
      if (what_rule<65) return; }
  if (what_rule>=65 && what_rule<68)
    { R17.NextRule(what_rule);
      if (what_rule<68) return; }
  if (what_rule>=68 && what_rule<71)
    { R18.NextRule(what_rule);
      if (what_rule<71) return; }
  if (what_rule>=71 && what_rule<74)
    { R19.NextRule(what_rule);
      if (what_rule<74) return; }
  if (what_rule>=74 && what_rule<75)
    { R20.NextRule(what_rule);
      if (what_rule<75) return; }
  if (what_rule>=75 && what_rule<78)
    { R21.NextRule(what_rule);
      if (what_rule<78) return; }
  if (what_rule>=78 && what_rule<79)
    { R22.NextRule(what_rule);
      if (what_rule<79) return; }
  if (what_rule>=79 && what_rule<82)
    { R23.NextRule(what_rule);
      if (what_rule<82) return; }
  if (what_rule>=82 && what_rule<83)
    { R24.NextRule(what_rule);
      if (what_rule<83) return; }
  if (what_rule>=83 && what_rule<86)
    { R25.NextRule(what_rule);
      if (what_rule<86) return; }
  if (what_rule>=86 && what_rule<87)
    { R26.NextRule(what_rule);
      if (what_rule<87) return; }
  if (what_rule>=87 && what_rule<88)
    { R27.NextRule(what_rule);
      if (what_rule<88) return; }
  if (what_rule>=88 && what_rule<91)
    { R28.NextRule(what_rule);
      if (what_rule<91) return; }
  if (what_rule>=91 && what_rule<92)
    { R29.NextRule(what_rule);
      if (what_rule<92) return; }
  if (what_rule>=92 && what_rule<93)
    { R30.NextRule(what_rule);
      if (what_rule<93) return; }
  if (what_rule>=93 && what_rule<96)
    { R31.NextRule(what_rule);
      if (what_rule<96) return; }
  if (what_rule>=96 && what_rule<102)
    { R32.NextRule(what_rule);
      if (what_rule<102) return; }
}
bool Condition(unsigned r)
{
  category = CONDITION;
  if (r<=2) return R0.Condition(r-0);
  if (r>=3 && r<=3) return R1.Condition(r-3);
  if (r>=4 && r<=4) return R2.Condition(r-4);
  if (r>=5 && r<=5) return R3.Condition(r-5);
  if (r>=6 && r<=8) return R4.Condition(r-6);
  if (r>=9 && r<=11) return R5.Condition(r-9);
  if (r>=12 && r<=14) return R6.Condition(r-12);
  if (r>=15 && r<=15) return R7.Condition(r-15);
  if (r>=16 && r<=18) return R8.Condition(r-16);
  if (r>=19 && r<=19) return R9.Condition(r-19);
  if (r>=20 && r<=28) return R10.Condition(r-20);
  if (r>=29 && r<=37) return R11.Condition(r-29);
  if (r>=38 && r<=40) return R12.Condition(r-38);
  if (r>=41 && r<=43) return R13.Condition(r-41);
  if (r>=44 && r<=46) return R14.Condition(r-44);
  if (r>=47 && r<=55) return R15.Condition(r-47);
  if (r>=56 && r<=64) return R16.Condition(r-56);
  if (r>=65 && r<=67) return R17.Condition(r-65);
  if (r>=68 && r<=70) return R18.Condition(r-68);
  if (r>=71 && r<=73) return R19.Condition(r-71);
  if (r>=74 && r<=74) return R20.Condition(r-74);
  if (r>=75 && r<=77) return R21.Condition(r-75);
  if (r>=78 && r<=78) return R22.Condition(r-78);
  if (r>=79 && r<=81) return R23.Condition(r-79);
  if (r>=82 && r<=82) return R24.Condition(r-82);
  if (r>=83 && r<=85) return R25.Condition(r-83);
  if (r>=86 && r<=86) return R26.Condition(r-86);
  if (r>=87 && r<=87) return R27.Condition(r-87);
  if (r>=88 && r<=90) return R28.Condition(r-88);
  if (r>=91 && r<=91) return R29.Condition(r-91);
  if (r>=92 && r<=92) return R30.Condition(r-92);
  if (r>=93 && r<=95) return R31.Condition(r-93);
  if (r>=96 && r<=101) return R32.Condition(r-96);
Error.Notrace("Internal: NextStateGenerator -- checking condition for nonexisting rule.");
return 0;}
void Code(unsigned r)
{
  if (r<=2) { R0.Code(r-0); return; } 
  if (r>=3 && r<=3) { R1.Code(r-3); return; } 
  if (r>=4 && r<=4) { R2.Code(r-4); return; } 
  if (r>=5 && r<=5) { R3.Code(r-5); return; } 
  if (r>=6 && r<=8) { R4.Code(r-6); return; } 
  if (r>=9 && r<=11) { R5.Code(r-9); return; } 
  if (r>=12 && r<=14) { R6.Code(r-12); return; } 
  if (r>=15 && r<=15) { R7.Code(r-15); return; } 
  if (r>=16 && r<=18) { R8.Code(r-16); return; } 
  if (r>=19 && r<=19) { R9.Code(r-19); return; } 
  if (r>=20 && r<=28) { R10.Code(r-20); return; } 
  if (r>=29 && r<=37) { R11.Code(r-29); return; } 
  if (r>=38 && r<=40) { R12.Code(r-38); return; } 
  if (r>=41 && r<=43) { R13.Code(r-41); return; } 
  if (r>=44 && r<=46) { R14.Code(r-44); return; } 
  if (r>=47 && r<=55) { R15.Code(r-47); return; } 
  if (r>=56 && r<=64) { R16.Code(r-56); return; } 
  if (r>=65 && r<=67) { R17.Code(r-65); return; } 
  if (r>=68 && r<=70) { R18.Code(r-68); return; } 
  if (r>=71 && r<=73) { R19.Code(r-71); return; } 
  if (r>=74 && r<=74) { R20.Code(r-74); return; } 
  if (r>=75 && r<=77) { R21.Code(r-75); return; } 
  if (r>=78 && r<=78) { R22.Code(r-78); return; } 
  if (r>=79 && r<=81) { R23.Code(r-79); return; } 
  if (r>=82 && r<=82) { R24.Code(r-82); return; } 
  if (r>=83 && r<=85) { R25.Code(r-83); return; } 
  if (r>=86 && r<=86) { R26.Code(r-86); return; } 
  if (r>=87 && r<=87) { R27.Code(r-87); return; } 
  if (r>=88 && r<=90) { R28.Code(r-88); return; } 
  if (r>=91 && r<=91) { R29.Code(r-91); return; } 
  if (r>=92 && r<=92) { R30.Code(r-92); return; } 
  if (r>=93 && r<=95) { R31.Code(r-93); return; } 
  if (r>=96 && r<=101) { R32.Code(r-96); return; } 
}
int Priority(unsigned short r)
{
  if (r<=2) { return R0.Priority(); } 
  if (r>=3 && r<=3) { return R1.Priority(); } 
  if (r>=4 && r<=4) { return R2.Priority(); } 
  if (r>=5 && r<=5) { return R3.Priority(); } 
  if (r>=6 && r<=8) { return R4.Priority(); } 
  if (r>=9 && r<=11) { return R5.Priority(); } 
  if (r>=12 && r<=14) { return R6.Priority(); } 
  if (r>=15 && r<=15) { return R7.Priority(); } 
  if (r>=16 && r<=18) { return R8.Priority(); } 
  if (r>=19 && r<=19) { return R9.Priority(); } 
  if (r>=20 && r<=28) { return R10.Priority(); } 
  if (r>=29 && r<=37) { return R11.Priority(); } 
  if (r>=38 && r<=40) { return R12.Priority(); } 
  if (r>=41 && r<=43) { return R13.Priority(); } 
  if (r>=44 && r<=46) { return R14.Priority(); } 
  if (r>=47 && r<=55) { return R15.Priority(); } 
  if (r>=56 && r<=64) { return R16.Priority(); } 
  if (r>=65 && r<=67) { return R17.Priority(); } 
  if (r>=68 && r<=70) { return R18.Priority(); } 
  if (r>=71 && r<=73) { return R19.Priority(); } 
  if (r>=74 && r<=74) { return R20.Priority(); } 
  if (r>=75 && r<=77) { return R21.Priority(); } 
  if (r>=78 && r<=78) { return R22.Priority(); } 
  if (r>=79 && r<=81) { return R23.Priority(); } 
  if (r>=82 && r<=82) { return R24.Priority(); } 
  if (r>=83 && r<=85) { return R25.Priority(); } 
  if (r>=86 && r<=86) { return R26.Priority(); } 
  if (r>=87 && r<=87) { return R27.Priority(); } 
  if (r>=88 && r<=90) { return R28.Priority(); } 
  if (r>=91 && r<=91) { return R29.Priority(); } 
  if (r>=92 && r<=92) { return R30.Priority(); } 
  if (r>=93 && r<=95) { return R31.Priority(); } 
  if (r>=96 && r<=101) { return R32.Priority(); } 
return 0;}
char * Name(unsigned r)
{
  if (r<=2) return R0.Name(r-0);
  if (r>=3 && r<=3) return R1.Name(r-3);
  if (r>=4 && r<=4) return R2.Name(r-4);
  if (r>=5 && r<=5) return R3.Name(r-5);
  if (r>=6 && r<=8) return R4.Name(r-6);
  if (r>=9 && r<=11) return R5.Name(r-9);
  if (r>=12 && r<=14) return R6.Name(r-12);
  if (r>=15 && r<=15) return R7.Name(r-15);
  if (r>=16 && r<=18) return R8.Name(r-16);
  if (r>=19 && r<=19) return R9.Name(r-19);
  if (r>=20 && r<=28) return R10.Name(r-20);
  if (r>=29 && r<=37) return R11.Name(r-29);
  if (r>=38 && r<=40) return R12.Name(r-38);
  if (r>=41 && r<=43) return R13.Name(r-41);
  if (r>=44 && r<=46) return R14.Name(r-44);
  if (r>=47 && r<=55) return R15.Name(r-47);
  if (r>=56 && r<=64) return R16.Name(r-56);
  if (r>=65 && r<=67) return R17.Name(r-65);
  if (r>=68 && r<=70) return R18.Name(r-68);
  if (r>=71 && r<=73) return R19.Name(r-71);
  if (r>=74 && r<=74) return R20.Name(r-74);
  if (r>=75 && r<=77) return R21.Name(r-75);
  if (r>=78 && r<=78) return R22.Name(r-78);
  if (r>=79 && r<=81) return R23.Name(r-79);
  if (r>=82 && r<=82) return R24.Name(r-82);
  if (r>=83 && r<=85) return R25.Name(r-83);
  if (r>=86 && r<=86) return R26.Name(r-86);
  if (r>=87 && r<=87) return R27.Name(r-87);
  if (r>=88 && r<=90) return R28.Name(r-88);
  if (r>=91 && r<=91) return R29.Name(r-91);
  if (r>=92 && r<=92) return R30.Name(r-92);
  if (r>=93 && r<=95) return R31.Name(r-93);
  if (r>=96 && r<=101) return R32.Name(r-96);
  return NULL;
}
};
const unsigned numrules = 102;

/********************
  parameter
 ********************/
#define RULES_IN_WORLD 102


/********************
  Startstate records
 ********************/
/******************** StartStateBase0 ********************/
class StartStateBase0
{
public:
  char * Name(unsigned short r)
  {
    static mu_1_NODE mu_h;
    mu_h.value((r % 3) + 1);
    r = r / 3;
    static mu_1_DATA mu_d;
    mu_d.value((r % 2) + 4);
    r = r / 2;
    return tsprintf("Init, h:%s, d:%s", mu_h.Name(), mu_d.Name());
  }
  void Code(unsigned short r)
  {
    static mu_1_NODE mu_h;
    mu_h.value((r % 3) + 1);
    r = r / 3;
    static mu_1_DATA mu_d;
    mu_d.value((r % 2) + 4);
    r = r / 2;
mu_Home = mu_h;
mu_Sta.undefine();
mu_Sta.mu_MemData = mu_d;
mu_Sta.mu_Dir.mu_Pending = mu_false;
mu_Sta.mu_Dir.mu_Local = mu_false;
mu_Sta.mu_Dir.mu_Dirty = mu_false;
mu_Sta.mu_Dir.mu_HeadVld = mu_false;
mu_Sta.mu_Dir.mu_ShrVld = mu_false;
mu_Sta.mu_WbMsg.mu_Cmd = mu_WB_None;
mu_Sta.mu_ShWbMsg.mu_Cmd = mu_SHWB_None;
mu_Sta.mu_NakcMsg.mu_Cmd = mu_NAKC_None;
{
for(int mu_p = 1; mu_p <= 3; mu_p++) {
mu_Sta.mu_Proc[mu_p].mu_ProcCmd = mu_NODE_None;
mu_Sta.mu_Proc[mu_p].mu_InvMarked = mu_false;
mu_Sta.mu_Proc[mu_p].mu_CacheState = mu_CACHE_I;
mu_Sta.mu_Dir.mu_ShrSet[mu_p] = mu_false;
mu_Sta.mu_Dir.mu_InvSet[mu_p] = mu_false;
mu_Sta.mu_UniMsg[mu_p].mu_Cmd = mu_UNI_None;
mu_Sta.mu_InvMsg[mu_p].mu_Cmd = mu_INV_None;
mu_Sta.mu_RpMsg[mu_p].mu_Cmd = mu_RP_None;
};
};
mu_Sta.mu_CurrData = mu_d;
mu_Sta.mu_PrevData = mu_d;
mu_Sta.mu_LastWrVld = mu_false;
mu_Sta.mu_Collecting = mu_false;
mu_Sta.mu_FwdCmd = mu_UNI_None;
  };

};
class StartStateGenerator
{
  StartStateBase0 S0;
public:
void Code(unsigned short r)
{
  if (r<=5) { S0.Code(r-0); return; }
}
char * Name(unsigned short r)
{
  if (r<=5) return S0.Name(r-0);
  return NULL;
}
};
const rulerec startstates[] = {
{ NULL, NULL, NULL, FALSE},
};
unsigned short StartStateManager::numstartstates = 6;

/********************
  Invariant records
 ********************/
int mu__invariant_211() // Invariant "MemDataProp"
{
bool mu__boolexpr212;
  if (!(!(mu_Sta.mu_Dir.mu_Dirty))) mu__boolexpr212 = TRUE ;
  else {
  mu__boolexpr212 = ((mu_Sta.mu_MemData) == (mu_Sta.mu_CurrData)) ; 
}
return mu__boolexpr212;
};

bool mu__condition_213() // Condition for Rule "MemDataProp"
{
  return mu__invariant_211( );
}

/**** end rule declaration ****/

int mu__invariant_214() // Invariant "CacheDataProp"
{
bool mu__quant215; 
mu__quant215 = TRUE;
{
for(int mu_p = 1; mu_p <= 3; mu_p++) {
bool mu__boolexpr216;
bool mu__boolexpr217;
  if (!((mu_Sta.mu_Proc[mu_p].mu_CacheState) == (mu_CACHE_E))) mu__boolexpr217 = TRUE ;
  else {
  mu__boolexpr217 = ((mu_Sta.mu_Proc[mu_p].mu_CacheData) == (mu_Sta.mu_CurrData)) ; 
}
  if (!(mu__boolexpr217)) mu__boolexpr216 = FALSE ;
  else {
bool mu__boolexpr218;
  if (!((mu_Sta.mu_Proc[mu_p].mu_CacheState) == (mu_CACHE_S))) mu__boolexpr218 = TRUE ;
  else {
bool mu__boolexpr219;
bool mu__boolexpr220;
  if (!(mu_Sta.mu_Collecting)) mu__boolexpr220 = TRUE ;
  else {
  mu__boolexpr220 = ((mu_Sta.mu_Proc[mu_p].mu_CacheData) == (mu_Sta.mu_PrevData)) ; 
}
  if (!(mu__boolexpr220)) mu__boolexpr219 = FALSE ;
  else {
bool mu__boolexpr221;
  if (!(!(mu_Sta.mu_Collecting))) mu__boolexpr221 = TRUE ;
  else {
  mu__boolexpr221 = ((mu_Sta.mu_Proc[mu_p].mu_CacheData) == (mu_Sta.mu_CurrData)) ; 
}
  mu__boolexpr219 = (mu__boolexpr221) ; 
}
  mu__boolexpr218 = (mu__boolexpr219) ; 
}
  mu__boolexpr216 = (mu__boolexpr218) ; 
}
if ( !(mu__boolexpr216) )
  { mu__quant215 = FALSE; break; }
};
};
return mu__quant215;
};

bool mu__condition_222() // Condition for Rule "CacheDataProp"
{
  return mu__invariant_214( );
}

/**** end rule declaration ****/

int mu__invariant_223() // Invariant "CacheStateProp"
{
bool mu__quant224; 
mu__quant224 = TRUE;
{
for(int mu_p = 1; mu_p <= 3; mu_p++) {
bool mu__quant225; 
mu__quant225 = TRUE;
{
for(int mu_q = 1; mu_q <= 3; mu_q++) {
bool mu__boolexpr226;
  if (!((mu_p) != (mu_q))) mu__boolexpr226 = TRUE ;
  else {
bool mu__boolexpr227;
  if (!((mu_Sta.mu_Proc[mu_p].mu_CacheState) == (mu_CACHE_E))) mu__boolexpr227 = FALSE ;
  else {
  mu__boolexpr227 = ((mu_Sta.mu_Proc[mu_q].mu_CacheState) == (mu_CACHE_E)) ; 
}
  mu__boolexpr226 = (!(mu__boolexpr227)) ; 
}
if ( !(mu__boolexpr226) )
  { mu__quant225 = FALSE; break; }
};
};
if ( !(mu__quant225) )
  { mu__quant224 = FALSE; break; }
};
};
return mu__quant224;
};

bool mu__condition_228() // Condition for Rule "CacheStateProp"
{
  return mu__invariant_223( );
}

/**** end rule declaration ****/

const rulerec invariants[] = {
{"CacheStateProp", &mu__condition_228, NULL, },
{"CacheDataProp", &mu__condition_222, NULL, },
{"MemDataProp", &mu__condition_213, NULL, },
};
const unsigned short numinvariants = 3;

/********************
  Normal/Canonicalization for scalarset
 ********************/
/*
Home:ScalarsetVariable
Sta:ScalarsetArrayOfScalarset
*/

/********************
Code for symmetry
 ********************/

/********************
 Permutation Set Class
 ********************/
class PermSet
{
public:
  // book keeping
  enum PresentationType {Simple, Explicit};
  PresentationType Presentation;

  void ResetToSimple();
  void ResetToExplicit();
  void SimpleToExplicit();
  void SimpleToOne();
  bool NextPermutation();

  void Print_in_size()
  { int ret=0; for (int i=0; i<count; i++) if (in[i]) ret++; cout << "in_size:" << ret << "\n"; }


  /********************
   Simple and efficient representation
   ********************/
  int class_mu_1_DATA[2];
  int undefined_class_mu_1_DATA;// has the highest class number

  void Print_class_mu_1_DATA();
  bool OnlyOneRemain_mu_1_DATA;
  bool MTO_class_mu_1_DATA()
  {
    int i,j;
    if (OnlyOneRemain_mu_1_DATA)
      return FALSE;
    for (i=0; i<2; i++)
      for (j=0; j<2; j++)
        if (i!=j && class_mu_1_DATA[i]== class_mu_1_DATA[j])
	    return TRUE;
    OnlyOneRemain_mu_1_DATA = TRUE;
    return FALSE;
  }
  int class_mu_1_NODE[3];
  int undefined_class_mu_1_NODE;// has the highest class number

  void Print_class_mu_1_NODE();
  bool OnlyOneRemain_mu_1_NODE;
  bool MTO_class_mu_1_NODE()
  {
    int i,j;
    if (OnlyOneRemain_mu_1_NODE)
      return FALSE;
    for (i=0; i<3; i++)
      for (j=0; j<3; j++)
        if (i!=j && class_mu_1_NODE[i]== class_mu_1_NODE[j])
	    return TRUE;
    OnlyOneRemain_mu_1_NODE = TRUE;
    return FALSE;
  }
  bool AlreadyOnlyOneRemain;
  bool MoreThanOneRemain();


  /********************
   Explicit representation
  ********************/
  unsigned long size;
  unsigned long count;
  // in will be of product of factorial sizes for fast canonicalize
  // in will be of size 1 for reduced local memory canonicalize
  bool * in;

  // auxiliary for explicit representation

  // in/perm/revperm will be of factorial size for fast canonicalize
  // they will be of size 1 for reduced local memory canonicalize
  // second range will be size of the scalarset
  int * in_mu_1_DATA;
  typedef int arr_mu_1_DATA[2];
  arr_mu_1_DATA * perm_mu_1_DATA;
  arr_mu_1_DATA * revperm_mu_1_DATA;

  int size_mu_1_DATA[2];
  bool reversed_sorted_mu_1_DATA(int start, int end);
  void reverse_reversed_mu_1_DATA(int start, int end);

  int * in_mu_1_NODE;
  typedef int arr_mu_1_NODE[3];
  arr_mu_1_NODE * perm_mu_1_NODE;
  arr_mu_1_NODE * revperm_mu_1_NODE;

  int size_mu_1_NODE[3];
  bool reversed_sorted_mu_1_NODE(int start, int end);
  void reverse_reversed_mu_1_NODE(int start, int end);

  // procedure for explicit representation
  bool ok0(mu_1_DATA* perm, int size, mu_1_DATA k);
  void GenPerm0(mu_1_DATA* perm, int size, unsigned long& index);

  bool ok1(mu_1_NODE* perm, int size, mu_1_NODE k);
  void GenPerm1(mu_1_NODE* perm, int size, unsigned long& index);

  // General procedure
  PermSet();
  bool In(int i) const { return in[i]; };
  void Add(int i) { for (int j=0; j<i; j++) in[j] = FALSE;};
  void Remove(int i) { in[i] = FALSE; };
};
void PermSet::Print_class_mu_1_DATA()
{
  cout << "class_mu_1_DATA:\t";
  for (int i=0; i<2; i++)
    cout << class_mu_1_DATA[i];
  cout << " " << undefined_class_mu_1_DATA << "\n";
}
void PermSet::Print_class_mu_1_NODE()
{
  cout << "class_mu_1_NODE:\t";
  for (int i=0; i<3; i++)
    cout << class_mu_1_NODE[i];
  cout << " " << undefined_class_mu_1_NODE << "\n";
}
bool PermSet::MoreThanOneRemain()
{
  int i,j;
  if (AlreadyOnlyOneRemain)
    return FALSE;
  else {
    for (i=0; i<2; i++)
      for (j=0; j<2; j++)
        if (i!=j && class_mu_1_DATA[i]== class_mu_1_DATA[j])
	    return TRUE;
    for (i=0; i<3; i++)
      for (j=0; j<3; j++)
        if (i!=j && class_mu_1_NODE[i]== class_mu_1_NODE[j])
	    return TRUE;
  }
  AlreadyOnlyOneRemain = TRUE;
  return FALSE;
}
PermSet::PermSet()
: Presentation(Simple)
{
  int i,j,k;
  if (  args->sym_alg.mode == argsym_alg::Exhaustive_Fast_Canonicalize
     || args->sym_alg.mode == argsym_alg::Heuristic_Fast_Canonicalize) {
    mu_1_DATA Perm0[2];
    mu_1_NODE Perm1[3];

  /********************
   declaration of class variables
  ********************/
  in = new bool[12];
 in_mu_1_DATA = new int[12];
 perm_mu_1_DATA = new arr_mu_1_DATA[2];
 revperm_mu_1_DATA = new arr_mu_1_DATA[2];
 in_mu_1_NODE = new int[12];
 perm_mu_1_NODE = new arr_mu_1_NODE[6];
 revperm_mu_1_NODE = new arr_mu_1_NODE[6];

    // Set perm and revperm
    count = 0;
    for (i=4; i<=5; i++)
      {
        Perm0[0].value(i);
        GenPerm0(Perm0, 1, count);
      }
    if (count!=2)
      Error.Error( "unable to initialize PermSet");
    for (i=0; i<2; i++)
      for (j=4; j<=5; j++)
        for (k=4; k<=5; k++)
          if (revperm_mu_1_DATA[i][k-4]==j)   // k - base 
            perm_mu_1_DATA[i][j-4]=k; // j - base 
    count = 0;
    for (i=1; i<=3; i++)
      {
        Perm1[0].value(i);
        GenPerm1(Perm1, 1, count);
      }
    if (count!=6)
      Error.Error( "unable to initialize PermSet");
    for (i=0; i<6; i++)
      for (j=1; j<=3; j++)
        for (k=1; k<=3; k++)
          if (revperm_mu_1_NODE[i][k-1]==j)   // k - base 
            perm_mu_1_NODE[i][j-1]=k; // j - base 

    // setting up combination of permutations
    // for different scalarset
    int carry;
    int i_mu_1_DATA = 0;
    int i_mu_1_NODE = 0;
    size = 12;
    count = 12;
    for (i=0; i<12; i++)
      {
        carry = 1;
        in[i]= TRUE;
      in_mu_1_DATA[i] = i_mu_1_DATA;
      i_mu_1_DATA += carry;
      if (i_mu_1_DATA >= 2) { i_mu_1_DATA = 0; carry = 1; } 
      else { carry = 0; } 
      in_mu_1_NODE[i] = i_mu_1_NODE;
      i_mu_1_NODE += carry;
      if (i_mu_1_NODE >= 6) { i_mu_1_NODE = 0; carry = 1; } 
      else { carry = 0; } 
    }
  }
  else
  {

  /********************
   declaration of class variables
  ********************/
  in = new bool[1];
 in_mu_1_DATA = new int[1];
 perm_mu_1_DATA = new arr_mu_1_DATA[1];
 revperm_mu_1_DATA = new arr_mu_1_DATA[1];
 in_mu_1_NODE = new int[1];
 perm_mu_1_NODE = new arr_mu_1_NODE[1];
 revperm_mu_1_NODE = new arr_mu_1_NODE[1];
  in[0] = TRUE;
    in_mu_1_DATA[0] = 0;
    in_mu_1_NODE[0] = 0;
  }
}
void PermSet::ResetToSimple()
{
  int i;
  for (i=0; i<2; i++)
    class_mu_1_DATA[i]=0;
  undefined_class_mu_1_DATA=0;
  OnlyOneRemain_mu_1_DATA = FALSE;
  for (i=0; i<3; i++)
    class_mu_1_NODE[i]=0;
  undefined_class_mu_1_NODE=0;
  OnlyOneRemain_mu_1_NODE = FALSE;

  AlreadyOnlyOneRemain = FALSE;
  Presentation = Simple;
}
void PermSet::ResetToExplicit()
{
  for (int i=0; i<12; i++) in[i] = TRUE;
  Presentation = Explicit;
}
void PermSet::SimpleToExplicit()
{
  int i,j,k;
  int start, class_size;
  int start_mu_1_DATA[2];
  int size_mu_1_DATA[2];
  bool should_be_in_mu_1_DATA[2];
  int start_mu_1_NODE[3];
  int size_mu_1_NODE[3];
  bool should_be_in_mu_1_NODE[6];

  // Setup range for mapping
  start = 0;
  for (j=0; j<=undefined_class_mu_1_DATA; j++) // class number
    {
      class_size = 0;
      for (k=0; k<2; k++) // step through class_mu_1_pid[k]
	if (class_mu_1_DATA[k]==j)
	  class_size++;
      for (k=0; k<2; k++) // step through class_mu_1_pid[k]
	if (class_mu_1_DATA[k]==j)
	  {
	    size_mu_1_DATA[k] = class_size;
	    start_mu_1_DATA[k] = start;
	  }
      start+=class_size;
    }
  start = 0;
  for (j=0; j<=undefined_class_mu_1_NODE; j++) // class number
    {
      class_size = 0;
      for (k=0; k<3; k++) // step through class_mu_1_pid[k]
	if (class_mu_1_NODE[k]==j)
	  class_size++;
      for (k=0; k<3; k++) // step through class_mu_1_pid[k]
	if (class_mu_1_NODE[k]==j)
	  {
	    size_mu_1_NODE[k] = class_size;
	    start_mu_1_NODE[k] = start;
	  }
      start+=class_size;
    }

  // To be In or not to be
  for (i=0; i<2; i++) // set up
    should_be_in_mu_1_DATA[i] = TRUE;
  for (i=0; i<2; i++) // to be in or not to be
    for (k=0; k<2; k++) // step through class_mu_1_pid[k]
      if (! (perm_mu_1_DATA[i][k]-4 >=start_mu_1_DATA[k] 
	     && perm_mu_1_DATA[i][k]-4 < start_mu_1_DATA[k] + size_mu_1_DATA[k]) )
  	    {
	      should_be_in_mu_1_DATA[i] = FALSE;
	      break;
	    }
  for (i=0; i<6; i++) // set up
    should_be_in_mu_1_NODE[i] = TRUE;
  for (i=0; i<6; i++) // to be in or not to be
    for (k=0; k<3; k++) // step through class_mu_1_pid[k]
      if (! (perm_mu_1_NODE[i][k]-1 >=start_mu_1_NODE[k] 
	     && perm_mu_1_NODE[i][k]-1 < start_mu_1_NODE[k] + size_mu_1_NODE[k]) )
  	    {
	      should_be_in_mu_1_NODE[i] = FALSE;
	      break;
	    }

  // setup explicit representation 
  // Set perm and revperm
  for (i=0; i<12; i++)
    {
      in[i] = TRUE;
      if (in[i] && !should_be_in_mu_1_DATA[in_mu_1_DATA[i]]) in[i] = FALSE;
      if (in[i] && !should_be_in_mu_1_NODE[in_mu_1_NODE[i]]) in[i] = FALSE;
    }
  Presentation = Explicit;
  if (args->test_parameter1.value==0) Print_in_size();
}
void PermSet::SimpleToOne()
{
  int i,j,k;
  int class_size;
  int start;


  // Setup range for mapping
  start = 0;
  for (j=0; j<=undefined_class_mu_1_DATA; j++) // class number
    {
      class_size = 0;
      for (k=0; k<2; k++) // step through class_mu_1_pid[k]
	if (class_mu_1_DATA[k]==j)
	  class_size++;
      for (k=0; k<2; k++) // step through class_mu_1_pid[k]
	if (class_mu_1_DATA[k]==j)
	  {
	    size_mu_1_DATA[k] = class_size;
	  }
      start+=class_size;
    }
  start = 0;
  for (j=0; j<=undefined_class_mu_1_NODE; j++) // class number
    {
      class_size = 0;
      for (k=0; k<3; k++) // step through class_mu_1_pid[k]
	if (class_mu_1_NODE[k]==j)
	  class_size++;
      for (k=0; k<3; k++) // step through class_mu_1_pid[k]
	if (class_mu_1_NODE[k]==j)
	  {
	    size_mu_1_NODE[k] = class_size;
	  }
      start+=class_size;
    }
  start = 0;
  for (j=0; j<=undefined_class_mu_1_DATA; j++) // class number
    {
      for (k=0; k<2; k++) // step through class_mu_1_pid[k]
	    if (class_mu_1_DATA[k]==j)
	      revperm_mu_1_DATA[0][start++] = k+4;
    }
  for (j=0; j<2; j++)
    for (k=0; k<2; k++)
      if (revperm_mu_1_DATA[0][k]==j+4)
        perm_mu_1_DATA[0][j]=k+4;
  start = 0;
  for (j=0; j<=undefined_class_mu_1_NODE; j++) // class number
    {
      for (k=0; k<3; k++) // step through class_mu_1_pid[k]
	    if (class_mu_1_NODE[k]==j)
	      revperm_mu_1_NODE[0][start++] = k+1;
    }
  for (j=0; j<3; j++)
    for (k=0; k<3; k++)
      if (revperm_mu_1_NODE[0][k]==j+1)
        perm_mu_1_NODE[0][j]=k+1;
  Presentation = Explicit;
}
bool PermSet::ok0(mu_1_DATA* Perm, int size, mu_1_DATA k)
{
  for (int i=0; i<size; i++)
    if(Perm[i].value()==k)
      return FALSE;
  return TRUE;
}
void PermSet::GenPerm0(mu_1_DATA* Perm,int size, unsigned long& count)
{
  int i;
  if (size!=2)
    {
      for (i=4; i<=5; i++)
        if(ok0(Perm,size,i))
          {
            Perm[size].value(i);
            GenPerm0(Perm, size+1, count);
          }
    }
  else
    {
      for (i=4; i<=5; i++)
        revperm_mu_1_DATA[count][i-4]=Perm[i-4].value();// i - base
      count++;
    }
}
bool PermSet::ok1(mu_1_NODE* Perm, int size, mu_1_NODE k)
{
  for (int i=0; i<size; i++)
    if(Perm[i].value()==k)
      return FALSE;
  return TRUE;
}
void PermSet::GenPerm1(mu_1_NODE* Perm,int size, unsigned long& count)
{
  int i;
  if (size!=3)
    {
      for (i=1; i<=3; i++)
        if(ok1(Perm,size,i))
          {
            Perm[size].value(i);
            GenPerm1(Perm, size+1, count);
          }
    }
  else
    {
      for (i=1; i<=3; i++)
        revperm_mu_1_NODE[count][i-1]=Perm[i-1].value();// i - base
      count++;
    }
}
bool PermSet::reversed_sorted_mu_1_DATA(int start, int end)
{
  int i,j;

  for (i=start; i<end; i++)
    if (revperm_mu_1_DATA[0][i]<revperm_mu_1_DATA[0][i+1])
      return FALSE;
  return TRUE;
}
void PermSet::reverse_reversed_mu_1_DATA(int start, int end)
{
  int i,j;
  int temp;

  for (i=start, j=end; i<j; i++,j--) 
    {
      temp = revperm_mu_1_DATA[0][j];
      revperm_mu_1_DATA[0][j] = revperm_mu_1_DATA[0][i];
      revperm_mu_1_DATA[0][i] = temp;
    }
}
bool PermSet::reversed_sorted_mu_1_NODE(int start, int end)
{
  int i,j;

  for (i=start; i<end; i++)
    if (revperm_mu_1_NODE[0][i]<revperm_mu_1_NODE[0][i+1])
      return FALSE;
  return TRUE;
}
void PermSet::reverse_reversed_mu_1_NODE(int start, int end)
{
  int i,j;
  int temp;

  for (i=start, j=end; i<j; i++,j--) 
    {
      temp = revperm_mu_1_NODE[0][j];
      revperm_mu_1_NODE[0][j] = revperm_mu_1_NODE[0][i];
      revperm_mu_1_NODE[0][i] = temp;
    }
}
bool PermSet::NextPermutation()
{
  bool nexted = FALSE;
  int start, end; 
  int class_size;
  int temp;
  int j,k;

  // algorithm
  // for each class
  //   if forall in the same class reverse_sorted, 
  //     { sort again; goto next class }
  //   else
  //     {
  //       nexted = TRUE;
  //       for (j from l to r)
  // 	       if (for all j+ are reversed sorted)
  // 	         {
  // 	           swap j, j+1
  // 	           sort all j+ again
  // 	           break;
  // 	         }
  //     }
  for (start = 0; start < 2; )
    {
      end = start-1+size_mu_1_DATA[revperm_mu_1_DATA[0][start]-4];
      if (reversed_sorted_mu_1_DATA(start,end))
	       {
	  reverse_reversed_mu_1_DATA(start,end);
	  start = end+1;
	}
      else
	{
	  nexted = TRUE;
	  for (j = start; j<end; j++)
	    {
	      if (reversed_sorted_mu_1_DATA(j+1,end))
		{
		  for (k = end; k>j; k--)
		    {
		      if (revperm_mu_1_DATA[0][j]<revperm_mu_1_DATA[0][k])
			{
			  // swap j, k
			  temp = revperm_mu_1_DATA[0][j];
			  revperm_mu_1_DATA[0][j] = revperm_mu_1_DATA[0][k];
			  revperm_mu_1_DATA[0][k] = temp;
			  break;
			}
		    }
		  reverse_reversed_mu_1_DATA(j+1,end);
		  break;
		}
	    }
	  break;
	}
    }
if (!nexted) {
  for (start = 0; start < 3; )
    {
      end = start-1+size_mu_1_NODE[revperm_mu_1_NODE[0][start]-1];
      if (reversed_sorted_mu_1_NODE(start,end))
	       {
	  reverse_reversed_mu_1_NODE(start,end);
	  start = end+1;
	}
      else
	{
	  nexted = TRUE;
	  for (j = start; j<end; j++)
	    {
	      if (reversed_sorted_mu_1_NODE(j+1,end))
		{
		  for (k = end; k>j; k--)
		    {
		      if (revperm_mu_1_NODE[0][j]<revperm_mu_1_NODE[0][k])
			{
			  // swap j, k
			  temp = revperm_mu_1_NODE[0][j];
			  revperm_mu_1_NODE[0][j] = revperm_mu_1_NODE[0][k];
			  revperm_mu_1_NODE[0][k] = temp;
			  break;
			}
		    }
		  reverse_reversed_mu_1_NODE(j+1,end);
		  break;
		}
	    }
	  break;
	}
    }
}
if (!nexted) return FALSE;
  for (j=0; j<2; j++)
    for (k=0; k<2; k++)
      if (revperm_mu_1_DATA[0][k]==j+4)   // k - base 
	perm_mu_1_DATA[0][j]=k+4; // j - base 
  for (j=0; j<3; j++)
    for (k=0; k<3; k++)
      if (revperm_mu_1_NODE[0][k]==j+1)   // k - base 
	perm_mu_1_NODE[0][j]=k+1; // j - base 
  return TRUE;
}

/********************
 Symmetry Class
 ********************/
class SymmetryClass
{
  PermSet Perm;
  bool BestInitialized;
  state BestPermutedState;

  // utilities
  void SetBestResult(int i, state* temp);
  void ResetBestResult() {BestInitialized = FALSE;};

public:
  // initializer
  SymmetryClass() : Perm(), BestInitialized(FALSE) {};
  ~SymmetryClass() {};

  void Normalize(state* s);

  void Exhaustive_Fast_Canonicalize(state *s);
  void Heuristic_Fast_Canonicalize(state *s);
  void Heuristic_Small_Mem_Canonicalize(state *s);
  void Heuristic_Fast_Normalize(state *s);

  void MultisetSort(state* s);
};


/********************
 Symmetry Class Members
 ********************/
void SymmetryClass::MultisetSort(state* s)
{
        mu_Home.MultisetSort();
        mu_Sta.MultisetSort();
}
void SymmetryClass::Normalize(state* s)
{
  switch (args->sym_alg.mode) {
  case argsym_alg::Exhaustive_Fast_Canonicalize:
    Exhaustive_Fast_Canonicalize(s);
    break;
  case argsym_alg::Heuristic_Fast_Canonicalize:
    Heuristic_Fast_Canonicalize(s);
    break;
  case argsym_alg::Heuristic_Small_Mem_Canonicalize:
    Heuristic_Small_Mem_Canonicalize(s);
    break;
  case argsym_alg::Heuristic_Fast_Normalize:
    Heuristic_Fast_Normalize(s);
    break;
  default:
    Heuristic_Fast_Canonicalize(s);
  }
}

/********************
 Permute and Canonicalize function for different types
 ********************/
void mu_1_NODE::Permute(PermSet& Perm, int i)
{
  if (Perm.Presentation != PermSet::Explicit)
    Error.Error("Internal Error: Wrong Sequence of Normalization");
  if (defined())
    value(Perm.perm_mu_1_NODE[Perm.in_mu_1_NODE[i]][value()-1]); // value - base
};
void mu_1_NODE::SimpleCanonicalize(PermSet& Perm)
{
  int i, class_number;
  if (Perm.Presentation != PermSet::Simple)
    Error.Error("Internal Error: Wrong Sequence of Normalization");

  if (defined())
    if (Perm.class_mu_1_NODE[value()-1]==Perm.undefined_class_mu_1_NODE) // value - base
      {
        // it has not been mapped to any particular value
        for (i=0; i<3; i++)
          if (Perm.class_mu_1_NODE[i] == Perm.undefined_class_mu_1_NODE && i!=value()-1)
            Perm.class_mu_1_NODE[i]++;
        value(1 + Perm.undefined_class_mu_1_NODE++);
      }
    else 
      {
        value(Perm.class_mu_1_NODE[value()-1]+1);
      }
}
void mu_1_NODE::Canonicalize(PermSet& Perm)
{
  Error.Error("Calling canonicalize() for Scalarset.");
}
void mu_1_NODE::SimpleLimit(PermSet& Perm)
{
  int i, class_number;
  if (Perm.Presentation != PermSet::Simple)
    Error.Error("Internal Error: Wrong Sequence of Normalization");

  if (defined())
    if (Perm.class_mu_1_NODE[value()-1]==Perm.undefined_class_mu_1_NODE) // value - base
      {
        // it has not been mapped to any particular value
        for (i=0; i<3; i++)
          if (Perm.class_mu_1_NODE[i] == Perm.undefined_class_mu_1_NODE && i!=value()-1)
            Perm.class_mu_1_NODE[i]++;
        Perm.undefined_class_mu_1_NODE++;
      }
}
void mu_1_NODE::ArrayLimit(PermSet& Perm) {}
void mu_1_NODE::Limit(PermSet& Perm) {}
void mu_1_NODE::MultisetLimit(PermSet& Perm)
{ Error.Error("Internal: calling MultisetLimit for scalarset type.\n"); };
void mu_1_DATA::Permute(PermSet& Perm, int i)
{
  if (Perm.Presentation != PermSet::Explicit)
    Error.Error("Internal Error: Wrong Sequence of Normalization");
  if (defined())
    value(Perm.perm_mu_1_DATA[Perm.in_mu_1_DATA[i]][value()-4]); // value - base
};
void mu_1_DATA::SimpleCanonicalize(PermSet& Perm)
{
  int i, class_number;
  if (Perm.Presentation != PermSet::Simple)
    Error.Error("Internal Error: Wrong Sequence of Normalization");

  if (defined())
    if (Perm.class_mu_1_DATA[value()-4]==Perm.undefined_class_mu_1_DATA) // value - base
      {
        // it has not been mapped to any particular value
        for (i=0; i<2; i++)
          if (Perm.class_mu_1_DATA[i] == Perm.undefined_class_mu_1_DATA && i!=value()-4)
            Perm.class_mu_1_DATA[i]++;
        value(4 + Perm.undefined_class_mu_1_DATA++);
      }
    else 
      {
        value(Perm.class_mu_1_DATA[value()-4]+4);
      }
}
void mu_1_DATA::Canonicalize(PermSet& Perm)
{
  Error.Error("Calling canonicalize() for Scalarset.");
}
void mu_1_DATA::SimpleLimit(PermSet& Perm)
{
  int i, class_number;
  if (Perm.Presentation != PermSet::Simple)
    Error.Error("Internal Error: Wrong Sequence of Normalization");

  if (defined())
    if (Perm.class_mu_1_DATA[value()-4]==Perm.undefined_class_mu_1_DATA) // value - base
      {
        // it has not been mapped to any particular value
        for (i=0; i<2; i++)
          if (Perm.class_mu_1_DATA[i] == Perm.undefined_class_mu_1_DATA && i!=value()-4)
            Perm.class_mu_1_DATA[i]++;
        Perm.undefined_class_mu_1_DATA++;
      }
}
void mu_1_DATA::ArrayLimit(PermSet& Perm) {}
void mu_1_DATA::Limit(PermSet& Perm) {}
void mu_1_DATA::MultisetLimit(PermSet& Perm)
{ Error.Error("Internal: calling MultisetLimit for scalarset type.\n"); };
void mu__enum_5::Permute(PermSet& Perm, int i) {};
void mu__enum_5::SimpleCanonicalize(PermSet& Perm) {};
void mu__enum_5::Canonicalize(PermSet& Perm) {};
void mu__enum_5::SimpleLimit(PermSet& Perm) {};
void mu__enum_5::ArrayLimit(PermSet& Perm) {};
void mu__enum_5::Limit(PermSet& Perm) {};
void mu__enum_5::MultisetLimit(PermSet& Perm)
{ Error.Error("Internal: calling MultisetLimit for enum type.\n"); };
void mu_1_ABS_NODE::Permute(PermSet& Perm, int i)
{
  if (Perm.Presentation != PermSet::Explicit)
    Error.Error("Internal Error: Wrong Sequence of Normalization");
  if (defined()) {
    if ( ( value() >= 1 ) && ( value() <= 3 ) )
      value(Perm.perm_mu_1_NODE[Perm.in_mu_1_NODE[i]][value()-1]+(0)); // value - base
  }
}
void mu_1_ABS_NODE::SimpleCanonicalize(PermSet& Perm)
{
  int i, class_number;
  if (Perm.Presentation != PermSet::Simple)
    Error.Error("Internal Error: Wrong Sequence of Normalization");
  if (defined()) {
    if ( ( value() >= 1 ) && ( value() <= 3 ) )
      {
        if (Perm.class_mu_1_NODE[value()-1]==Perm.undefined_class_mu_1_NODE) // value - base
          {
            // it has not been mapped to any particular value
            for (i=0; i<3; i++)
              if (Perm.class_mu_1_NODE[i] == Perm.undefined_class_mu_1_NODE && i!=value()-1)
                Perm.class_mu_1_NODE[i]++;
            value(1 + Perm.undefined_class_mu_1_NODE++);
          }
        else 
          {
            value(Perm.class_mu_1_NODE[value()-1]+1);
          }
      }
  }
}
void mu_1_ABS_NODE::Canonicalize(PermSet& Perm)
{
  Error.Error("Calling canonicalize() for Scalarset.");
}
void mu_1_ABS_NODE::SimpleLimit(PermSet& Perm)
{
  int i, class_number;
  if (Perm.Presentation != PermSet::Simple)
    Error.Error("Internal Error: Wrong Sequence of Normalization");
  if (defined()) {
    if ( ( value() >= 1 ) && ( value() <= 3 ) )
      if (Perm.class_mu_1_NODE[value()-1]==Perm.undefined_class_mu_1_NODE) // value - base
        {
          // it has not been mapped to any particular value
          for (i=0; i<3; i++)
            if (Perm.class_mu_1_NODE[i] == Perm.undefined_class_mu_1_NODE && i!=value()-1)
              Perm.class_mu_1_NODE[i]++;
          Perm.undefined_class_mu_1_NODE++;
        }
  }
}
void mu_1_ABS_NODE::ArrayLimit(PermSet& Perm) {}
void mu_1_ABS_NODE::Limit(PermSet& Perm) {}
void mu_1_ABS_NODE::MultisetLimit(PermSet& Perm)
{ Error.Error("Internal: calling MultisetLimit for union type.\n"); };
void mu_1_CACHE_STATE::Permute(PermSet& Perm, int i) {};
void mu_1_CACHE_STATE::SimpleCanonicalize(PermSet& Perm) {};
void mu_1_CACHE_STATE::Canonicalize(PermSet& Perm) {};
void mu_1_CACHE_STATE::SimpleLimit(PermSet& Perm) {};
void mu_1_CACHE_STATE::ArrayLimit(PermSet& Perm) {};
void mu_1_CACHE_STATE::Limit(PermSet& Perm) {};
void mu_1_CACHE_STATE::MultisetLimit(PermSet& Perm)
{ Error.Error("Internal: calling MultisetLimit for enum type.\n"); };
void mu_1_NODE_CMD::Permute(PermSet& Perm, int i) {};
void mu_1_NODE_CMD::SimpleCanonicalize(PermSet& Perm) {};
void mu_1_NODE_CMD::Canonicalize(PermSet& Perm) {};
void mu_1_NODE_CMD::SimpleLimit(PermSet& Perm) {};
void mu_1_NODE_CMD::ArrayLimit(PermSet& Perm) {};
void mu_1_NODE_CMD::Limit(PermSet& Perm) {};
void mu_1_NODE_CMD::MultisetLimit(PermSet& Perm)
{ Error.Error("Internal: calling MultisetLimit for enum type.\n"); };
void mu_1_NODE_STATE::Permute(PermSet& Perm, int i)
{
  mu_CacheData.Permute(Perm,i);
};
void mu_1_NODE_STATE::SimpleCanonicalize(PermSet& Perm)
{
  mu_CacheData.SimpleCanonicalize(Perm);
};
void mu_1_NODE_STATE::Canonicalize(PermSet& Perm)
{
};
void mu_1_NODE_STATE::SimpleLimit(PermSet& Perm)
{
  mu_CacheData.SimpleLimit(Perm);
};
void mu_1_NODE_STATE::ArrayLimit(PermSet& Perm){}
void mu_1_NODE_STATE::Limit(PermSet& Perm)
{
};
void mu_1_NODE_STATE::MultisetLimit(PermSet& Perm)
{
};
void mu_1__type_0::Permute(PermSet& Perm, int i)
{
  static mu_1__type_0 temp("Permute_mu_1__type_0",-1);
  int j;
  for (j=0; j<3; j++)
    array[j].Permute(Perm, i);
  temp = *this;
  for (j=1; j<=3; j++)
     (*this)[j].value(temp[Perm.revperm_mu_1_NODE[Perm.in_mu_1_NODE[i]][j-1]].value());};
void mu_1__type_0::SimpleCanonicalize(PermSet& Perm)
{ Error.Error("Internal: Simple Canonicalization of Scalarset Array\n"); };
void mu_1__type_0::Canonicalize(PermSet& Perm)
{
  // indexes
  int i,j,k,z;
  // sorting
  int count_mu_1_NODE;
  int compare;
  static mu_0_boolean value[3];
  // limit
  bool exists;
  bool split;
  bool goodset_mu_1_NODE[3];
  bool pos_mu_1_NODE[3][3];
  // range mapping
  int start;
  int class_size;
  int size_mu_1_NODE[3];
  int start_mu_1_NODE[3];
  // canonicalization
  static mu_1__type_0 temp;
  // sorting mu_1_NODE
  // only if there is more than 1 permutation in class
  if (Perm.MTO_class_mu_1_NODE())
    {
      for (i=0; i<3; i++)
        for (j=0; j<3; j++)
          pos_mu_1_NODE[i][j]=FALSE;
      count_mu_1_NODE = 0;
      for (i=0; i<3; i++)
        {
          for (j=0; j<count_mu_1_NODE; j++)
            {
              compare = CompareWeight(value[j],(*this)[i+1]);
              if (compare==0)
                {
                  pos_mu_1_NODE[j][i]= TRUE;
                  break;
                }
              else if (compare>0)
                {
                  for (k=count_mu_1_NODE; k>j; k--)
                    {
                      value[k].value(value[k-1].value());
                      for (z=0; z<3; z++)
                        pos_mu_1_NODE[k][z] = pos_mu_1_NODE[k-1][z];
                    }
                  value[j].value((*this)[i+1].value());
                  for (z=0; z<3; z++)
                    pos_mu_1_NODE[j][z] = FALSE;
                  pos_mu_1_NODE[j][i] = TRUE;
                  count_mu_1_NODE++;
                  break;
                }
            }
          if (j==count_mu_1_NODE)
            {
                value[j].value((*this)[i+1].value());
              for (z=0; z<3; z++)
                pos_mu_1_NODE[j][z] = FALSE;
              pos_mu_1_NODE[j][i] = TRUE;
              count_mu_1_NODE++;
            }
        }
    }
  // if there is more than 1 permutation in class
  if (Perm.MTO_class_mu_1_NODE() && count_mu_1_NODE>1)
    {
      // limit
      for (j=0; j<3; j++) // class priority
        {
          for (i=0; i<count_mu_1_NODE; i++) // for value priority
            {
              exists = FALSE;
              for (k=0; k<3; k++) // step through class
                goodset_mu_1_NODE[k] = FALSE;
              for (k=0; k<3; k++) // step through class
                if (pos_mu_1_NODE[i][k] && Perm.class_mu_1_NODE[k] == j)
                  {
                    exists = TRUE;
                    goodset_mu_1_NODE[k] = TRUE;
                    pos_mu_1_NODE[i][k] = FALSE;
                  }
              if (exists)
                {
                  split=FALSE;
                  for (k=0; k<3; k++)
                    if ( Perm.class_mu_1_NODE[k] == j && !goodset_mu_1_NODE[k] ) 
                      split= TRUE;
                  if (split)
                    {
                      for (k=0; k<3; k++)
                        if (Perm.class_mu_1_NODE[k]>j
                            || ( Perm.class_mu_1_NODE[k] == j && !goodset_mu_1_NODE[k] ) )
                          Perm.class_mu_1_NODE[k]++;
                      Perm.undefined_class_mu_1_NODE++;
                    }
                }
            }
        }
    }
  if (Perm.MTO_class_mu_1_NODE())
    {

      // setup range for maping
      start = 0;
      for (j=0; j<=Perm.undefined_class_mu_1_NODE; j++) // class number
        {
          class_size = 0;
          for (k=0; k<3; k++) // step through class[k]
            if (Perm.class_mu_1_NODE[k]==j)
              class_size++;
          for (k=0; k<3; k++) // step through class[k]
            if (Perm.class_mu_1_NODE[k]==j)
              {
                size_mu_1_NODE[k] = class_size;
                start_mu_1_NODE[k] = start;
              }
          start+=class_size;
        }

      // canonicalize
      temp = *this;
      for (i=0; i<3; i++)
        for (j=0; j<3; j++)
         if (i >=start_mu_1_NODE[j] 
             && i < start_mu_1_NODE[j] + size_mu_1_NODE[j])
           {
             array[i+0].value(temp[j+1].value());
             break;
           }
    }
  else
    {

      // fast canonicalize
      temp = *this;
      for (j=0; j<3; j++)
        array[Perm.class_mu_1_NODE[j]+0].value(temp[j+1].value());
    }
}
void mu_1__type_0::SimpleLimit(PermSet& Perm){}
void mu_1__type_0::ArrayLimit(PermSet& Perm)
{
  // indexes
  int i,j,k,z;
  // sorting
  int count_mu_1_NODE;
  int compare;
  static mu_0_boolean value[3];
  // limit
  bool exists;
  bool split;
  bool goodset_mu_1_NODE[3];
  bool pos_mu_1_NODE[3][3];
  // sorting mu_1_NODE
  // only if there is more than 1 permutation in class
  if (Perm.MTO_class_mu_1_NODE())
    {
      for (i=0; i<3; i++)
        for (j=0; j<3; j++)
          pos_mu_1_NODE[i][j]=FALSE;
      count_mu_1_NODE = 0;
      for (i=0; i<3; i++)
        {
          for (j=0; j<count_mu_1_NODE; j++)
            {
              compare = CompareWeight(value[j],(*this)[i+1]);
              if (compare==0)
                {
                  pos_mu_1_NODE[j][i]= TRUE;
                  break;
                }
              else if (compare>0)
                {
                  for (k=count_mu_1_NODE; k>j; k--)
                    {
                      value[k].value(value[k-1].value());
                      for (z=0; z<3; z++)
                        pos_mu_1_NODE[k][z] = pos_mu_1_NODE[k-1][z];
                    }
                  value[j].value((*this)[i+1].value());
                  for (z=0; z<3; z++)
                    pos_mu_1_NODE[j][z] = FALSE;
                  pos_mu_1_NODE[j][i] = TRUE;
                  count_mu_1_NODE++;
                  break;
                }
            }
          if (j==count_mu_1_NODE)
            {
                value[j].value((*this)[i+1].value());
              for (z=0; z<3; z++)
                pos_mu_1_NODE[j][z] = FALSE;
              pos_mu_1_NODE[j][i] = TRUE;
              count_mu_1_NODE++;
            }
        }
    }
  // if there is more than 1 permutation in class
  if (Perm.MTO_class_mu_1_NODE() && count_mu_1_NODE>1)
    {
      // limit
      for (j=0; j<3; j++) // class priority
        {
          for (i=0; i<count_mu_1_NODE; i++) // for value priority
            {
              exists = FALSE;
              for (k=0; k<3; k++) // step through class
                goodset_mu_1_NODE[k] = FALSE;
              for (k=0; k<3; k++) // step through class
                if (pos_mu_1_NODE[i][k] && Perm.class_mu_1_NODE[k] == j)
                  {
                    exists = TRUE;
                    goodset_mu_1_NODE[k] = TRUE;
                    pos_mu_1_NODE[i][k] = FALSE;
                  }
              if (exists)
                {
                  split=FALSE;
                  for (k=0; k<3; k++)
                    if ( Perm.class_mu_1_NODE[k] == j && !goodset_mu_1_NODE[k] ) 
                      split= TRUE;
                  if (split)
                    {
                      for (k=0; k<3; k++)
                        if (Perm.class_mu_1_NODE[k]>j
                            || ( Perm.class_mu_1_NODE[k] == j && !goodset_mu_1_NODE[k] ) )
                          Perm.class_mu_1_NODE[k]++;
                      Perm.undefined_class_mu_1_NODE++;
                    }
                }
            }
        }
    }
}
void mu_1__type_0::Limit(PermSet& Perm){}
void mu_1__type_0::MultisetLimit(PermSet& Perm)
{ Error.Error("Internal: calling MultisetLimit for scalarset array.\n"); };
void mu_1__type_1::Permute(PermSet& Perm, int i)
{
  static mu_1__type_1 temp("Permute_mu_1__type_1",-1);
  int j;
  for (j=0; j<3; j++)
    array[j].Permute(Perm, i);
  temp = *this;
  for (j=1; j<=3; j++)
     (*this)[j].value(temp[Perm.revperm_mu_1_NODE[Perm.in_mu_1_NODE[i]][j-1]].value());};
void mu_1__type_1::SimpleCanonicalize(PermSet& Perm)
{ Error.Error("Internal: Simple Canonicalization of Scalarset Array\n"); };
void mu_1__type_1::Canonicalize(PermSet& Perm)
{
  // indexes
  int i,j,k,z;
  // sorting
  int count_mu_1_NODE;
  int compare;
  static mu_0_boolean value[3];
  // limit
  bool exists;
  bool split;
  bool goodset_mu_1_NODE[3];
  bool pos_mu_1_NODE[3][3];
  // range mapping
  int start;
  int class_size;
  int size_mu_1_NODE[3];
  int start_mu_1_NODE[3];
  // canonicalization
  static mu_1__type_1 temp;
  // sorting mu_1_NODE
  // only if there is more than 1 permutation in class
  if (Perm.MTO_class_mu_1_NODE())
    {
      for (i=0; i<3; i++)
        for (j=0; j<3; j++)
          pos_mu_1_NODE[i][j]=FALSE;
      count_mu_1_NODE = 0;
      for (i=0; i<3; i++)
        {
          for (j=0; j<count_mu_1_NODE; j++)
            {
              compare = CompareWeight(value[j],(*this)[i+1]);
              if (compare==0)
                {
                  pos_mu_1_NODE[j][i]= TRUE;
                  break;
                }
              else if (compare>0)
                {
                  for (k=count_mu_1_NODE; k>j; k--)
                    {
                      value[k].value(value[k-1].value());
                      for (z=0; z<3; z++)
                        pos_mu_1_NODE[k][z] = pos_mu_1_NODE[k-1][z];
                    }
                  value[j].value((*this)[i+1].value());
                  for (z=0; z<3; z++)
                    pos_mu_1_NODE[j][z] = FALSE;
                  pos_mu_1_NODE[j][i] = TRUE;
                  count_mu_1_NODE++;
                  break;
                }
            }
          if (j==count_mu_1_NODE)
            {
                value[j].value((*this)[i+1].value());
              for (z=0; z<3; z++)
                pos_mu_1_NODE[j][z] = FALSE;
              pos_mu_1_NODE[j][i] = TRUE;
              count_mu_1_NODE++;
            }
        }
    }
  // if there is more than 1 permutation in class
  if (Perm.MTO_class_mu_1_NODE() && count_mu_1_NODE>1)
    {
      // limit
      for (j=0; j<3; j++) // class priority
        {
          for (i=0; i<count_mu_1_NODE; i++) // for value priority
            {
              exists = FALSE;
              for (k=0; k<3; k++) // step through class
                goodset_mu_1_NODE[k] = FALSE;
              for (k=0; k<3; k++) // step through class
                if (pos_mu_1_NODE[i][k] && Perm.class_mu_1_NODE[k] == j)
                  {
                    exists = TRUE;
                    goodset_mu_1_NODE[k] = TRUE;
                    pos_mu_1_NODE[i][k] = FALSE;
                  }
              if (exists)
                {
                  split=FALSE;
                  for (k=0; k<3; k++)
                    if ( Perm.class_mu_1_NODE[k] == j && !goodset_mu_1_NODE[k] ) 
                      split= TRUE;
                  if (split)
                    {
                      for (k=0; k<3; k++)
                        if (Perm.class_mu_1_NODE[k]>j
                            || ( Perm.class_mu_1_NODE[k] == j && !goodset_mu_1_NODE[k] ) )
                          Perm.class_mu_1_NODE[k]++;
                      Perm.undefined_class_mu_1_NODE++;
                    }
                }
            }
        }
    }
  if (Perm.MTO_class_mu_1_NODE())
    {

      // setup range for maping
      start = 0;
      for (j=0; j<=Perm.undefined_class_mu_1_NODE; j++) // class number
        {
          class_size = 0;
          for (k=0; k<3; k++) // step through class[k]
            if (Perm.class_mu_1_NODE[k]==j)
              class_size++;
          for (k=0; k<3; k++) // step through class[k]
            if (Perm.class_mu_1_NODE[k]==j)
              {
                size_mu_1_NODE[k] = class_size;
                start_mu_1_NODE[k] = start;
              }
          start+=class_size;
        }

      // canonicalize
      temp = *this;
      for (i=0; i<3; i++)
        for (j=0; j<3; j++)
         if (i >=start_mu_1_NODE[j] 
             && i < start_mu_1_NODE[j] + size_mu_1_NODE[j])
           {
             array[i+0].value(temp[j+1].value());
             break;
           }
    }
  else
    {

      // fast canonicalize
      temp = *this;
      for (j=0; j<3; j++)
        array[Perm.class_mu_1_NODE[j]+0].value(temp[j+1].value());
    }
}
void mu_1__type_1::SimpleLimit(PermSet& Perm){}
void mu_1__type_1::ArrayLimit(PermSet& Perm)
{
  // indexes
  int i,j,k,z;
  // sorting
  int count_mu_1_NODE;
  int compare;
  static mu_0_boolean value[3];
  // limit
  bool exists;
  bool split;
  bool goodset_mu_1_NODE[3];
  bool pos_mu_1_NODE[3][3];
  // sorting mu_1_NODE
  // only if there is more than 1 permutation in class
  if (Perm.MTO_class_mu_1_NODE())
    {
      for (i=0; i<3; i++)
        for (j=0; j<3; j++)
          pos_mu_1_NODE[i][j]=FALSE;
      count_mu_1_NODE = 0;
      for (i=0; i<3; i++)
        {
          for (j=0; j<count_mu_1_NODE; j++)
            {
              compare = CompareWeight(value[j],(*this)[i+1]);
              if (compare==0)
                {
                  pos_mu_1_NODE[j][i]= TRUE;
                  break;
                }
              else if (compare>0)
                {
                  for (k=count_mu_1_NODE; k>j; k--)
                    {
                      value[k].value(value[k-1].value());
                      for (z=0; z<3; z++)
                        pos_mu_1_NODE[k][z] = pos_mu_1_NODE[k-1][z];
                    }
                  value[j].value((*this)[i+1].value());
                  for (z=0; z<3; z++)
                    pos_mu_1_NODE[j][z] = FALSE;
                  pos_mu_1_NODE[j][i] = TRUE;
                  count_mu_1_NODE++;
                  break;
                }
            }
          if (j==count_mu_1_NODE)
            {
                value[j].value((*this)[i+1].value());
              for (z=0; z<3; z++)
                pos_mu_1_NODE[j][z] = FALSE;
              pos_mu_1_NODE[j][i] = TRUE;
              count_mu_1_NODE++;
            }
        }
    }
  // if there is more than 1 permutation in class
  if (Perm.MTO_class_mu_1_NODE() && count_mu_1_NODE>1)
    {
      // limit
      for (j=0; j<3; j++) // class priority
        {
          for (i=0; i<count_mu_1_NODE; i++) // for value priority
            {
              exists = FALSE;
              for (k=0; k<3; k++) // step through class
                goodset_mu_1_NODE[k] = FALSE;
              for (k=0; k<3; k++) // step through class
                if (pos_mu_1_NODE[i][k] && Perm.class_mu_1_NODE[k] == j)
                  {
                    exists = TRUE;
                    goodset_mu_1_NODE[k] = TRUE;
                    pos_mu_1_NODE[i][k] = FALSE;
                  }
              if (exists)
                {
                  split=FALSE;
                  for (k=0; k<3; k++)
                    if ( Perm.class_mu_1_NODE[k] == j && !goodset_mu_1_NODE[k] ) 
                      split= TRUE;
                  if (split)
                    {
                      for (k=0; k<3; k++)
                        if (Perm.class_mu_1_NODE[k]>j
                            || ( Perm.class_mu_1_NODE[k] == j && !goodset_mu_1_NODE[k] ) )
                          Perm.class_mu_1_NODE[k]++;
                      Perm.undefined_class_mu_1_NODE++;
                    }
                }
            }
        }
    }
}
void mu_1__type_1::Limit(PermSet& Perm){}
void mu_1__type_1::MultisetLimit(PermSet& Perm)
{ Error.Error("Internal: calling MultisetLimit for scalarset array.\n"); };
void mu_1_DIR_STATE::Permute(PermSet& Perm, int i)
{
  mu_HeadPtr.Permute(Perm,i);
  mu_ShrSet.Permute(Perm,i);
  mu_InvSet.Permute(Perm,i);
};
void mu_1_DIR_STATE::SimpleCanonicalize(PermSet& Perm)
{
  mu_HeadPtr.SimpleCanonicalize(Perm);
};
void mu_1_DIR_STATE::Canonicalize(PermSet& Perm)
{
  mu_ShrSet.Canonicalize(Perm);
  mu_InvSet.Canonicalize(Perm);
};
void mu_1_DIR_STATE::SimpleLimit(PermSet& Perm)
{
  mu_HeadPtr.SimpleLimit(Perm);
};
void mu_1_DIR_STATE::ArrayLimit(PermSet& Perm)
{
  mu_ShrSet.ArrayLimit(Perm);
  mu_InvSet.ArrayLimit(Perm);
};
void mu_1_DIR_STATE::Limit(PermSet& Perm)
{
};
void mu_1_DIR_STATE::MultisetLimit(PermSet& Perm)
{
};
void mu_1_UNI_CMD::Permute(PermSet& Perm, int i) {};
void mu_1_UNI_CMD::SimpleCanonicalize(PermSet& Perm) {};
void mu_1_UNI_CMD::Canonicalize(PermSet& Perm) {};
void mu_1_UNI_CMD::SimpleLimit(PermSet& Perm) {};
void mu_1_UNI_CMD::ArrayLimit(PermSet& Perm) {};
void mu_1_UNI_CMD::Limit(PermSet& Perm) {};
void mu_1_UNI_CMD::MultisetLimit(PermSet& Perm)
{ Error.Error("Internal: calling MultisetLimit for enum type.\n"); };
void mu_1_UNI_MSG::Permute(PermSet& Perm, int i)
{
  mu_Proc.Permute(Perm,i);
  mu_Data.Permute(Perm,i);
};
void mu_1_UNI_MSG::SimpleCanonicalize(PermSet& Perm)
{
  mu_Proc.SimpleCanonicalize(Perm);
  mu_Data.SimpleCanonicalize(Perm);
};
void mu_1_UNI_MSG::Canonicalize(PermSet& Perm)
{
};
void mu_1_UNI_MSG::SimpleLimit(PermSet& Perm)
{
  mu_Proc.SimpleLimit(Perm);
  mu_Data.SimpleLimit(Perm);
};
void mu_1_UNI_MSG::ArrayLimit(PermSet& Perm){}
void mu_1_UNI_MSG::Limit(PermSet& Perm)
{
};
void mu_1_UNI_MSG::MultisetLimit(PermSet& Perm)
{
};
void mu_1_INV_CMD::Permute(PermSet& Perm, int i) {};
void mu_1_INV_CMD::SimpleCanonicalize(PermSet& Perm) {};
void mu_1_INV_CMD::Canonicalize(PermSet& Perm) {};
void mu_1_INV_CMD::SimpleLimit(PermSet& Perm) {};
void mu_1_INV_CMD::ArrayLimit(PermSet& Perm) {};
void mu_1_INV_CMD::Limit(PermSet& Perm) {};
void mu_1_INV_CMD::MultisetLimit(PermSet& Perm)
{ Error.Error("Internal: calling MultisetLimit for enum type.\n"); };
void mu_1_INV_MSG::Permute(PermSet& Perm, int i)
{
};
void mu_1_INV_MSG::SimpleCanonicalize(PermSet& Perm)
{ Error.Error("Internal: Simple Canonicalization of Record with no scalarset variable\n"); };
void mu_1_INV_MSG::Canonicalize(PermSet& Perm)
{
};
void mu_1_INV_MSG::SimpleLimit(PermSet& Perm){}
void mu_1_INV_MSG::ArrayLimit(PermSet& Perm){}
void mu_1_INV_MSG::Limit(PermSet& Perm)
{
};
void mu_1_INV_MSG::MultisetLimit(PermSet& Perm)
{
};
void mu_1_RP_CMD::Permute(PermSet& Perm, int i) {};
void mu_1_RP_CMD::SimpleCanonicalize(PermSet& Perm) {};
void mu_1_RP_CMD::Canonicalize(PermSet& Perm) {};
void mu_1_RP_CMD::SimpleLimit(PermSet& Perm) {};
void mu_1_RP_CMD::ArrayLimit(PermSet& Perm) {};
void mu_1_RP_CMD::Limit(PermSet& Perm) {};
void mu_1_RP_CMD::MultisetLimit(PermSet& Perm)
{ Error.Error("Internal: calling MultisetLimit for enum type.\n"); };
void mu_1_RP_MSG::Permute(PermSet& Perm, int i)
{
};
void mu_1_RP_MSG::SimpleCanonicalize(PermSet& Perm)
{ Error.Error("Internal: Simple Canonicalization of Record with no scalarset variable\n"); };
void mu_1_RP_MSG::Canonicalize(PermSet& Perm)
{
};
void mu_1_RP_MSG::SimpleLimit(PermSet& Perm){}
void mu_1_RP_MSG::ArrayLimit(PermSet& Perm){}
void mu_1_RP_MSG::Limit(PermSet& Perm)
{
};
void mu_1_RP_MSG::MultisetLimit(PermSet& Perm)
{
};
void mu_1_WB_CMD::Permute(PermSet& Perm, int i) {};
void mu_1_WB_CMD::SimpleCanonicalize(PermSet& Perm) {};
void mu_1_WB_CMD::Canonicalize(PermSet& Perm) {};
void mu_1_WB_CMD::SimpleLimit(PermSet& Perm) {};
void mu_1_WB_CMD::ArrayLimit(PermSet& Perm) {};
void mu_1_WB_CMD::Limit(PermSet& Perm) {};
void mu_1_WB_CMD::MultisetLimit(PermSet& Perm)
{ Error.Error("Internal: calling MultisetLimit for enum type.\n"); };
void mu_1_WB_MSG::Permute(PermSet& Perm, int i)
{
  mu_Proc.Permute(Perm,i);
  mu_Data.Permute(Perm,i);
};
void mu_1_WB_MSG::SimpleCanonicalize(PermSet& Perm)
{
  mu_Proc.SimpleCanonicalize(Perm);
  mu_Data.SimpleCanonicalize(Perm);
};
void mu_1_WB_MSG::Canonicalize(PermSet& Perm)
{
};
void mu_1_WB_MSG::SimpleLimit(PermSet& Perm)
{
  mu_Proc.SimpleLimit(Perm);
  mu_Data.SimpleLimit(Perm);
};
void mu_1_WB_MSG::ArrayLimit(PermSet& Perm){}
void mu_1_WB_MSG::Limit(PermSet& Perm)
{
};
void mu_1_WB_MSG::MultisetLimit(PermSet& Perm)
{
};
void mu_1_SHWB_CMD::Permute(PermSet& Perm, int i) {};
void mu_1_SHWB_CMD::SimpleCanonicalize(PermSet& Perm) {};
void mu_1_SHWB_CMD::Canonicalize(PermSet& Perm) {};
void mu_1_SHWB_CMD::SimpleLimit(PermSet& Perm) {};
void mu_1_SHWB_CMD::ArrayLimit(PermSet& Perm) {};
void mu_1_SHWB_CMD::Limit(PermSet& Perm) {};
void mu_1_SHWB_CMD::MultisetLimit(PermSet& Perm)
{ Error.Error("Internal: calling MultisetLimit for enum type.\n"); };
void mu_1_SHWB_MSG::Permute(PermSet& Perm, int i)
{
  mu_Proc.Permute(Perm,i);
  mu_Data.Permute(Perm,i);
};
void mu_1_SHWB_MSG::SimpleCanonicalize(PermSet& Perm)
{
  mu_Proc.SimpleCanonicalize(Perm);
  mu_Data.SimpleCanonicalize(Perm);
};
void mu_1_SHWB_MSG::Canonicalize(PermSet& Perm)
{
};
void mu_1_SHWB_MSG::SimpleLimit(PermSet& Perm)
{
  mu_Proc.SimpleLimit(Perm);
  mu_Data.SimpleLimit(Perm);
};
void mu_1_SHWB_MSG::ArrayLimit(PermSet& Perm){}
void mu_1_SHWB_MSG::Limit(PermSet& Perm)
{
};
void mu_1_SHWB_MSG::MultisetLimit(PermSet& Perm)
{
};
void mu_1_NAKC_CMD::Permute(PermSet& Perm, int i) {};
void mu_1_NAKC_CMD::SimpleCanonicalize(PermSet& Perm) {};
void mu_1_NAKC_CMD::Canonicalize(PermSet& Perm) {};
void mu_1_NAKC_CMD::SimpleLimit(PermSet& Perm) {};
void mu_1_NAKC_CMD::ArrayLimit(PermSet& Perm) {};
void mu_1_NAKC_CMD::Limit(PermSet& Perm) {};
void mu_1_NAKC_CMD::MultisetLimit(PermSet& Perm)
{ Error.Error("Internal: calling MultisetLimit for enum type.\n"); };
void mu_1_NAKC_MSG::Permute(PermSet& Perm, int i)
{
};
void mu_1_NAKC_MSG::SimpleCanonicalize(PermSet& Perm)
{ Error.Error("Internal: Simple Canonicalization of Record with no scalarset variable\n"); };
void mu_1_NAKC_MSG::Canonicalize(PermSet& Perm)
{
};
void mu_1_NAKC_MSG::SimpleLimit(PermSet& Perm){}
void mu_1_NAKC_MSG::ArrayLimit(PermSet& Perm){}
void mu_1_NAKC_MSG::Limit(PermSet& Perm)
{
};
void mu_1_NAKC_MSG::MultisetLimit(PermSet& Perm)
{
};
void mu_1__type_2::Permute(PermSet& Perm, int i)
{
  static mu_1__type_2 temp("Permute_mu_1__type_2",-1);
  int j;
  for (j=0; j<3; j++)
    array[j].Permute(Perm, i);
  temp = *this;
  for (j=1; j<=3; j++)
    (*this)[j] = temp[Perm.revperm_mu_1_NODE[Perm.in_mu_1_NODE[i]][j-1]];};
void mu_1__type_2::SimpleCanonicalize(PermSet& Perm)
{ Error.Error("Internal: Simple Canonicalization of Scalarset Array\n"); };
void mu_1__type_2::Canonicalize(PermSet& Perm){};
void mu_1__type_2::SimpleLimit(PermSet& Perm){}
void mu_1__type_2::ArrayLimit(PermSet& Perm)
{
  // indexes
  int i,j,k,z;
  // sorting
  int count_mu_1_NODE;
  int compare;
  static mu_1_NODE_STATE value[3];
  // limit
  bool exists;
  bool split;
  bool goodset_mu_1_NODE[3];
  bool pos_mu_1_NODE[3][3];
  // sorting mu_1_NODE
  // only if there is more than 1 permutation in class
  if (Perm.MTO_class_mu_1_NODE())
    {
      for (i=0; i<3; i++)
        for (j=0; j<3; j++)
          pos_mu_1_NODE[i][j]=FALSE;
      count_mu_1_NODE = 0;
      for (i=0; i<3; i++)
        {
          for (j=0; j<count_mu_1_NODE; j++)
            {
              compare = CompareWeight(value[j],(*this)[i+1]);
              if (compare==0)
                {
                  pos_mu_1_NODE[j][i]= TRUE;
                  break;
                }
              else if (compare>0)
                {
                  for (k=count_mu_1_NODE; k>j; k--)
                    {
                      value[k] = value[k-1];
                      for (z=0; z<3; z++)
                        pos_mu_1_NODE[k][z] = pos_mu_1_NODE[k-1][z];
                    }
                  value[j] = (*this)[i+1];
                  for (z=0; z<3; z++)
                    pos_mu_1_NODE[j][z] = FALSE;
                  pos_mu_1_NODE[j][i] = TRUE;
                  count_mu_1_NODE++;
                  break;
                }
            }
          if (j==count_mu_1_NODE)
            {
              value[j] = (*this)[i+1];
              for (z=0; z<3; z++)
                pos_mu_1_NODE[j][z] = FALSE;
              pos_mu_1_NODE[j][i] = TRUE;
              count_mu_1_NODE++;
            }
        }
    }
  // if there is more than 1 permutation in class
  if (Perm.MTO_class_mu_1_NODE() && count_mu_1_NODE>1)
    {
      // limit
      for (j=0; j<3; j++) // class priority
        {
          for (i=0; i<count_mu_1_NODE; i++) // for value priority
            {
              exists = FALSE;
              for (k=0; k<3; k++) // step through class
                goodset_mu_1_NODE[k] = FALSE;
              for (k=0; k<3; k++) // step through class
                if (pos_mu_1_NODE[i][k] && Perm.class_mu_1_NODE[k] == j)
                  {
                    exists = TRUE;
                    goodset_mu_1_NODE[k] = TRUE;
                    pos_mu_1_NODE[i][k] = FALSE;
                  }
              if (exists)
                {
                  split=FALSE;
                  for (k=0; k<3; k++)
                    if ( Perm.class_mu_1_NODE[k] == j && !goodset_mu_1_NODE[k] ) 
                      split= TRUE;
                  if (split)
                    {
                      for (k=0; k<3; k++)
                        if (Perm.class_mu_1_NODE[k]>j
                            || ( Perm.class_mu_1_NODE[k] == j && !goodset_mu_1_NODE[k] ) )
                          Perm.class_mu_1_NODE[k]++;
                      Perm.undefined_class_mu_1_NODE++;
                    }
                }
            }
        }
    }
}
void mu_1__type_2::Limit(PermSet& Perm)
{
  // indexes
  int i,j,k,z;
  // while guard
  bool while_guard, while_guard_temp;
  // sorting
  static mu_1_NODE_STATE value[3];
  // limit
  bool exists;
  bool split;
  int i0;
  int count_mu_1_NODE, oldcount_mu_1_NODE;
  bool pos_mu_1_NODE[3][3];
  bool goodset_mu_1_NODE[3];
  int count_mu_1_DATA, oldcount_mu_1_DATA;
  bool pos_mu_1_DATA[2][2];
  bool goodset_mu_1_DATA[2];
  // count_ corresponds to the number of equivalence class within the
  // scalarset value.  If count_ == size of the scalarset, then a unique
  // permutation has been found.

  // pos_ is a relation on a equivalence class number and a scalarset value.

  // initializing pos array
  for (i=0; i<3; i++)
    for (j=0; j<3; j++)
      pos_mu_1_NODE[i][j]=FALSE;
  count_mu_1_NODE = 0;
  while (1)
    {
      exists = FALSE;
      for (i=0; i<3; i++)
       if (Perm.class_mu_1_NODE[i] == count_mu_1_NODE)
         {
           pos_mu_1_NODE[count_mu_1_NODE][i]=TRUE;
           exists = TRUE;
         }
      if (exists) count_mu_1_NODE++;
      else break;
    }
  // count_ corresponds to the number of equivalence class within the
  // scalarset value.  If count_ == size of the scalarset, then a unique
  // permutation has been found.

  // pos_ is a relation on a equivalence class number and a scalarset value.

  // initializing pos array
  for (i=0; i<2; i++)
    for (j=0; j<2; j++)
      pos_mu_1_DATA[i][j]=FALSE;
  count_mu_1_DATA = 0;
  while (1)
    {
      exists = FALSE;
      for (i=0; i<2; i++)
       if (Perm.class_mu_1_DATA[i] == count_mu_1_DATA)
         {
           pos_mu_1_DATA[count_mu_1_DATA][i]=TRUE;
           exists = TRUE;
         }
      if (exists) count_mu_1_DATA++;
      else break;
    }

  // refinement -- checking priority in general
  while_guard = FALSE;
  while_guard = while_guard || (Perm.MTO_class_mu_1_NODE() && count_mu_1_NODE<3);
  while_guard = while_guard || (Perm.MTO_class_mu_1_DATA() && count_mu_1_DATA<2);
  while ( while_guard )
    {
      oldcount_mu_1_NODE = count_mu_1_NODE;
      oldcount_mu_1_DATA = count_mu_1_DATA;

      // refinement -- graph structure for two scalarsets
      //               as in array S1 of S2
      // only if there is more than 1 permutation in class
      if ( (Perm.MTO_class_mu_1_NODE() && count_mu_1_NODE<3)
           || ( Perm.MTO_class_mu_1_DATA() && count_mu_1_DATA<2) )
        {
          exists = FALSE;
          split = FALSE;
          for (k=0; k<3; k++) // step through class
            if ((*this)[k+1].mu_CacheData.isundefined())
              exists = TRUE;
            else
              split = TRUE;
          if (exists && split)
            {
              for (i=0; i<count_mu_1_NODE; i++) // scan through array index priority
                for (j=0; j<count_mu_1_DATA; j++) //scan through element priority
                  {
                    exists = FALSE;
                    for (k=0; k<3; k++) // initialize goodset
                      goodset_mu_1_NODE[k] = FALSE;
                    for (k=0; k<2; k++) // initialize goodset
                      goodset_mu_1_DATA[k] = FALSE;
                    for (k=0; k<3; k++) // scan array index
                      // set goodsets
                      if (pos_mu_1_NODE[i][k] 
                          && !(*this)[k+1].mu_CacheData.isundefined()
                          && pos_mu_1_DATA[j][(*this)[k+1].mu_CacheData-4])
                        {
                          exists = TRUE;
                          goodset_mu_1_NODE[k] = TRUE;
                          goodset_mu_1_DATA[(*this)[k+1].mu_CacheData-4] = TRUE;
                        }
                    if (exists)
                      {
                        // set split for the array index type
                        split=FALSE;
                        for (k=0; k<3; k++)
                          if ( pos_mu_1_NODE[i][k] && !goodset_mu_1_NODE[k] )
                            split= TRUE;
                        if (split)
                          {
                            // move following pos entries down 1 step
                            for (z=count_mu_1_NODE; z>i; z--)
                              for (k=0; k<3; k++)
                                pos_mu_1_NODE[z][k] = pos_mu_1_NODE[z-1][k];
                            // split pos
                            for (k=0; k<3; k++)
                              {
                                if (pos_mu_1_NODE[i][k] && !goodset_mu_1_NODE[k])
                                  pos_mu_1_NODE[i][k] = FALSE;
                                if (pos_mu_1_NODE[i+1][k] && goodset_mu_1_NODE[k])
                                  pos_mu_1_NODE[i+1][k] = FALSE;
                              }
                            count_mu_1_NODE++;
                          }
                        // set split for the element type
                        split=FALSE;
                        for (k=0; k<2; k++)
                          if ( pos_mu_1_DATA[j][k] && !goodset_mu_1_DATA[k] )
                            split= TRUE;
                        if (split)
                          {
                            // move following pos entries down 1 step
                            for (z=count_mu_1_DATA; z>j; z--)
                              for (k=0; k<2; k++)
                                pos_mu_1_DATA[z][k] = pos_mu_1_DATA[z-1][k];
                            // split pos
                            for (k=0; k<2; k++)
                              {
                                if (pos_mu_1_DATA[j][k] && !goodset_mu_1_DATA[k])
                                  pos_mu_1_DATA[j][k] = FALSE;
                                if (pos_mu_1_DATA[j+1][k] && goodset_mu_1_DATA[k])
                                  pos_mu_1_DATA[j+1][k] = FALSE;
                              }
                            count_mu_1_DATA++;
                          }
                      }
                  }
            }
        }
      while_guard = FALSE;
      while_guard = while_guard || (oldcount_mu_1_NODE!=count_mu_1_NODE);
      while_guard = while_guard || (oldcount_mu_1_DATA!=count_mu_1_DATA);
      while_guard_temp = while_guard;
      while_guard = FALSE;
      while_guard = while_guard || count_mu_1_NODE<3;
      while_guard = while_guard || count_mu_1_DATA<2;
      while_guard = while_guard && while_guard_temp;
    } // end while
  // enter the result into class
  if (Perm.MTO_class_mu_1_NODE())
    {
      for (i=0; i<3; i++)
        for (j=0; j<3; j++)
          if (pos_mu_1_NODE[i][j])
            Perm.class_mu_1_NODE[j] = i;
      Perm.undefined_class_mu_1_NODE=0;
      for (j=0; j<3; j++)
        if (Perm.class_mu_1_NODE[j]>Perm.undefined_class_mu_1_NODE)
          Perm.undefined_class_mu_1_NODE=Perm.class_mu_1_NODE[j];
    }
  // enter the result into class
  if (Perm.MTO_class_mu_1_DATA())
    {
      for (i=0; i<2; i++)
        for (j=0; j<2; j++)
          if (pos_mu_1_DATA[i][j])
            Perm.class_mu_1_DATA[j] = i;
      Perm.undefined_class_mu_1_DATA=0;
      for (j=0; j<2; j++)
        if (Perm.class_mu_1_DATA[j]>Perm.undefined_class_mu_1_DATA)
          Perm.undefined_class_mu_1_DATA=Perm.class_mu_1_DATA[j];
    }
}
void mu_1__type_2::MultisetLimit(PermSet& Perm)
{ Error.Error("Internal: calling MultisetLimit for scalarset array.\n"); };
void mu_1__type_3::Permute(PermSet& Perm, int i)
{
  static mu_1__type_3 temp("Permute_mu_1__type_3",-1);
  int j;
  for (j=0; j<3; j++)
    array[j].Permute(Perm, i);
  temp = *this;
  for (j=1; j<=3; j++)
    (*this)[j] = temp[Perm.revperm_mu_1_NODE[Perm.in_mu_1_NODE[i]][j-1]];};
void mu_1__type_3::SimpleCanonicalize(PermSet& Perm)
{ Error.Error("Internal: Simple Canonicalization of Scalarset Array\n"); };
void mu_1__type_3::Canonicalize(PermSet& Perm){};
void mu_1__type_3::SimpleLimit(PermSet& Perm){}
void mu_1__type_3::ArrayLimit(PermSet& Perm)
{
  // indexes
  int i,j,k,z;
  // sorting
  int count_mu_1_NODE;
  int compare;
  static mu_1_UNI_MSG value[3];
  // limit
  bool exists;
  bool split;
  bool goodset_mu_1_NODE[3];
  bool pos_mu_1_NODE[3][3];
  // sorting mu_1_NODE
  // only if there is more than 1 permutation in class
  if (Perm.MTO_class_mu_1_NODE())
    {
      for (i=0; i<3; i++)
        for (j=0; j<3; j++)
          pos_mu_1_NODE[i][j]=FALSE;
      count_mu_1_NODE = 0;
      for (i=0; i<3; i++)
        {
          for (j=0; j<count_mu_1_NODE; j++)
            {
              compare = CompareWeight(value[j],(*this)[i+1]);
              if (compare==0)
                {
                  pos_mu_1_NODE[j][i]= TRUE;
                  break;
                }
              else if (compare>0)
                {
                  for (k=count_mu_1_NODE; k>j; k--)
                    {
                      value[k] = value[k-1];
                      for (z=0; z<3; z++)
                        pos_mu_1_NODE[k][z] = pos_mu_1_NODE[k-1][z];
                    }
                  value[j] = (*this)[i+1];
                  for (z=0; z<3; z++)
                    pos_mu_1_NODE[j][z] = FALSE;
                  pos_mu_1_NODE[j][i] = TRUE;
                  count_mu_1_NODE++;
                  break;
                }
            }
          if (j==count_mu_1_NODE)
            {
              value[j] = (*this)[i+1];
              for (z=0; z<3; z++)
                pos_mu_1_NODE[j][z] = FALSE;
              pos_mu_1_NODE[j][i] = TRUE;
              count_mu_1_NODE++;
            }
        }
    }
  // if there is more than 1 permutation in class
  if (Perm.MTO_class_mu_1_NODE() && count_mu_1_NODE>1)
    {
      // limit
      for (j=0; j<3; j++) // class priority
        {
          for (i=0; i<count_mu_1_NODE; i++) // for value priority
            {
              exists = FALSE;
              for (k=0; k<3; k++) // step through class
                goodset_mu_1_NODE[k] = FALSE;
              for (k=0; k<3; k++) // step through class
                if (pos_mu_1_NODE[i][k] && Perm.class_mu_1_NODE[k] == j)
                  {
                    exists = TRUE;
                    goodset_mu_1_NODE[k] = TRUE;
                    pos_mu_1_NODE[i][k] = FALSE;
                  }
              if (exists)
                {
                  split=FALSE;
                  for (k=0; k<3; k++)
                    if ( Perm.class_mu_1_NODE[k] == j && !goodset_mu_1_NODE[k] ) 
                      split= TRUE;
                  if (split)
                    {
                      for (k=0; k<3; k++)
                        if (Perm.class_mu_1_NODE[k]>j
                            || ( Perm.class_mu_1_NODE[k] == j && !goodset_mu_1_NODE[k] ) )
                          Perm.class_mu_1_NODE[k]++;
                      Perm.undefined_class_mu_1_NODE++;
                    }
                }
            }
        }
    }
}
void mu_1__type_3::Limit(PermSet& Perm)
{
  // indexes
  int i,j,k,z;
  // while guard
  bool while_guard, while_guard_temp;
  // sorting
  static mu_1_UNI_MSG value[3];
  // limit
  bool exists;
  bool split;
  int i0;
  int count_mu_1_DATA, oldcount_mu_1_DATA;
  bool pos_mu_1_DATA[2][2];
  bool goodset_mu_1_DATA[2];
  int count_mu_1_NODE, oldcount_mu_1_NODE;
  bool pos_mu_1_NODE[3][3];
  bool goodset_mu_1_NODE[3];
  // count_ corresponds to the number of equivalence class within the
  // scalarset value.  If count_ == size of the scalarset, then a unique
  // permutation has been found.

  // pos_ is a relation on a equivalence class number and a scalarset value.

  // initializing pos array
  for (i=0; i<2; i++)
    for (j=0; j<2; j++)
      pos_mu_1_DATA[i][j]=FALSE;
  count_mu_1_DATA = 0;
  while (1)
    {
      exists = FALSE;
      for (i=0; i<2; i++)
       if (Perm.class_mu_1_DATA[i] == count_mu_1_DATA)
         {
           pos_mu_1_DATA[count_mu_1_DATA][i]=TRUE;
           exists = TRUE;
         }
      if (exists) count_mu_1_DATA++;
      else break;
    }
  // count_ corresponds to the number of equivalence class within the
  // scalarset value.  If count_ == size of the scalarset, then a unique
  // permutation has been found.

  // pos_ is a relation on a equivalence class number and a scalarset value.

  // initializing pos array
  for (i=0; i<3; i++)
    for (j=0; j<3; j++)
      pos_mu_1_NODE[i][j]=FALSE;
  count_mu_1_NODE = 0;
  while (1)
    {
      exists = FALSE;
      for (i=0; i<3; i++)
       if (Perm.class_mu_1_NODE[i] == count_mu_1_NODE)
         {
           pos_mu_1_NODE[count_mu_1_NODE][i]=TRUE;
           exists = TRUE;
         }
      if (exists) count_mu_1_NODE++;
      else break;
    }

  // refinement -- check selfloop
  // only if there is more than 1 permutation in class
  if (Perm.MTO_class_mu_1_NODE() && count_mu_1_NODE<3)
    {
      exists = FALSE;
      split = FALSE;
      // if there exists both self loop and non-self loop
      for (k=0; k<3; k++) // step through class
        if ((*this)[k+1].mu_Proc.isundefined()
            ||(*this)[k+1].mu_Proc!=k+1)
          exists = TRUE;
        else
          split = TRUE;
      if (exists && split)
        {
          for (i=0; i<count_mu_1_NODE; i++) // for value priority
            {
              exists = FALSE;
              for (k=0; k<3; k++) // step through class
                goodset_mu_1_NODE[k] = FALSE;
              for (k=0; k<3; k++) // step through class
                if (pos_mu_1_NODE[i][k] 
                    && !(*this)[k+1].mu_Proc.isundefined()
                    && (*this)[k+1].mu_Proc==k+1)
                  {
                    exists = TRUE;
                    goodset_mu_1_NODE[k] = TRUE;
                  }
              if (exists)
                {
                  split=FALSE;
                  for (k=0; k<3; k++)
                    if ( pos_mu_1_NODE[i][k] && !goodset_mu_1_NODE[k] ) 
                          split= TRUE;
                  if (split)
                    {
                      for (j=count_mu_1_NODE; j>i; j--)
                        for (k=0; k<3; k++)
                          pos_mu_1_NODE[j][k] = pos_mu_1_NODE[j-1][k];
                      for (k=0; k<3; k++)
                        {
                          if (pos_mu_1_NODE[i][k] && !goodset_mu_1_NODE[k])
                            pos_mu_1_NODE[i][k] = FALSE;
                          if (pos_mu_1_NODE[i+1][k] && goodset_mu_1_NODE[k])
                            pos_mu_1_NODE[i+1][k] = FALSE;
                        }
                      count_mu_1_NODE++; i++;
                    }
                }
            }
        }
    }

  // refinement -- checking priority in general
  while_guard = FALSE;
  while_guard = while_guard || (Perm.MTO_class_mu_1_DATA() && count_mu_1_DATA<2);
  while_guard = while_guard || (Perm.MTO_class_mu_1_NODE() && count_mu_1_NODE<3);
  while ( while_guard )
    {
      oldcount_mu_1_DATA = count_mu_1_DATA;
      oldcount_mu_1_NODE = count_mu_1_NODE;

      // refinement -- graph structure for a single scalarset
      //               as in array S1 of S1
      // only if there is more than 1 permutation in class
      if (Perm.MTO_class_mu_1_NODE() && count_mu_1_NODE<3)
        {
          exists = FALSE;
          split = FALSE;
          for (k=0; k<3; k++) // step through class
            if (!(*this)[k+1].mu_Proc.isundefined()
                &&(*this)[k+1].mu_Proc!=k+1
                &&(*this)[k+1].mu_Proc>=1
                &&(*this)[k+1].mu_Proc<=3)
              exists = TRUE;
          if (exists)
            {
              for (i=0; i<count_mu_1_NODE; i++) // for value priority
                {
                  for (j=0; j<count_mu_1_NODE; j++) // for value priority
                    {
                      exists = FALSE;
                      for (k=0; k<3; k++) // step through class
                        goodset_mu_1_NODE[k] = FALSE;
                      for (k=0; k<3; k++) // step through class
                        if (pos_mu_1_NODE[i][k] 
                            && !(*this)[k+1].mu_Proc.isundefined()
                            && (*this)[k+1].mu_Proc!=k+1
                            && (*this)[k+1].mu_Proc>=1
                            && (*this)[k+1].mu_Proc<=3
                            && pos_mu_1_NODE[j][(*this)[k+1].mu_Proc-1])
                          {
                            exists = TRUE;
                            goodset_mu_1_NODE[k] = TRUE;
                          }
                      if (exists)
                        {
                          split=FALSE;
                          for (k=0; k<3; k++)
                            if ( pos_mu_1_NODE[i][k] && !goodset_mu_1_NODE[k] ) 
                              split= TRUE;
                          if (split)
                            {
                              for (j=count_mu_1_NODE; j>i; j--)
                                for (k=0; k<3; k++)
                                  pos_mu_1_NODE[j][k] = pos_mu_1_NODE[j-1][k];
                              for (k=0; k<3; k++)
                                {
                                  if (pos_mu_1_NODE[i][k] && !goodset_mu_1_NODE[k])
                                    pos_mu_1_NODE[i][k] = FALSE;
                                  if (pos_mu_1_NODE[i+1][k] && goodset_mu_1_NODE[k])
                                    pos_mu_1_NODE[i+1][k] = FALSE;                  
                                }
                              count_mu_1_NODE++;
                            }
                        }
                    }
                }
            }
        }

      // refinement -- graph structure for two scalarsets
      //               as in array S1 of S2
      // only if there is more than 1 permutation in class
      if ( (Perm.MTO_class_mu_1_NODE() && count_mu_1_NODE<3)
           || ( Perm.MTO_class_mu_1_DATA() && count_mu_1_DATA<2) )
        {
          exists = FALSE;
          split = FALSE;
          for (k=0; k<3; k++) // step through class
            if ((*this)[k+1].mu_Data.isundefined())
              exists = TRUE;
            else
              split = TRUE;
          if (exists && split)
            {
              for (i=0; i<count_mu_1_NODE; i++) // scan through array index priority
                for (j=0; j<count_mu_1_DATA; j++) //scan through element priority
                  {
                    exists = FALSE;
                    for (k=0; k<3; k++) // initialize goodset
                      goodset_mu_1_NODE[k] = FALSE;
                    for (k=0; k<2; k++) // initialize goodset
                      goodset_mu_1_DATA[k] = FALSE;
                    for (k=0; k<3; k++) // scan array index
                      // set goodsets
                      if (pos_mu_1_NODE[i][k] 
                          && !(*this)[k+1].mu_Data.isundefined()
                          && pos_mu_1_DATA[j][(*this)[k+1].mu_Data-4])
                        {
                          exists = TRUE;
                          goodset_mu_1_NODE[k] = TRUE;
                          goodset_mu_1_DATA[(*this)[k+1].mu_Data-4] = TRUE;
                        }
                    if (exists)
                      {
                        // set split for the array index type
                        split=FALSE;
                        for (k=0; k<3; k++)
                          if ( pos_mu_1_NODE[i][k] && !goodset_mu_1_NODE[k] )
                            split= TRUE;
                        if (split)
                          {
                            // move following pos entries down 1 step
                            for (z=count_mu_1_NODE; z>i; z--)
                              for (k=0; k<3; k++)
                                pos_mu_1_NODE[z][k] = pos_mu_1_NODE[z-1][k];
                            // split pos
                            for (k=0; k<3; k++)
                              {
                                if (pos_mu_1_NODE[i][k] && !goodset_mu_1_NODE[k])
                                  pos_mu_1_NODE[i][k] = FALSE;
                                if (pos_mu_1_NODE[i+1][k] && goodset_mu_1_NODE[k])
                                  pos_mu_1_NODE[i+1][k] = FALSE;
                              }
                            count_mu_1_NODE++;
                          }
                        // set split for the element type
                        split=FALSE;
                        for (k=0; k<2; k++)
                          if ( pos_mu_1_DATA[j][k] && !goodset_mu_1_DATA[k] )
                            split= TRUE;
                        if (split)
                          {
                            // move following pos entries down 1 step
                            for (z=count_mu_1_DATA; z>j; z--)
                              for (k=0; k<2; k++)
                                pos_mu_1_DATA[z][k] = pos_mu_1_DATA[z-1][k];
                            // split pos
                            for (k=0; k<2; k++)
                              {
                                if (pos_mu_1_DATA[j][k] && !goodset_mu_1_DATA[k])
                                  pos_mu_1_DATA[j][k] = FALSE;
                                if (pos_mu_1_DATA[j+1][k] && goodset_mu_1_DATA[k])
                                  pos_mu_1_DATA[j+1][k] = FALSE;
                              }
                            count_mu_1_DATA++;
                          }
                      }
                  }
            }
        }
      while_guard = FALSE;
      while_guard = while_guard || (oldcount_mu_1_DATA!=count_mu_1_DATA);
      while_guard = while_guard || (oldcount_mu_1_NODE!=count_mu_1_NODE);
      while_guard_temp = while_guard;
      while_guard = FALSE;
      while_guard = while_guard || count_mu_1_DATA<2;
      while_guard = while_guard || count_mu_1_NODE<3;
      while_guard = while_guard && while_guard_temp;
    } // end while
  // enter the result into class
  if (Perm.MTO_class_mu_1_DATA())
    {
      for (i=0; i<2; i++)
        for (j=0; j<2; j++)
          if (pos_mu_1_DATA[i][j])
            Perm.class_mu_1_DATA[j] = i;
      Perm.undefined_class_mu_1_DATA=0;
      for (j=0; j<2; j++)
        if (Perm.class_mu_1_DATA[j]>Perm.undefined_class_mu_1_DATA)
          Perm.undefined_class_mu_1_DATA=Perm.class_mu_1_DATA[j];
    }
  // enter the result into class
  if (Perm.MTO_class_mu_1_NODE())
    {
      for (i=0; i<3; i++)
        for (j=0; j<3; j++)
          if (pos_mu_1_NODE[i][j])
            Perm.class_mu_1_NODE[j] = i;
      Perm.undefined_class_mu_1_NODE=0;
      for (j=0; j<3; j++)
        if (Perm.class_mu_1_NODE[j]>Perm.undefined_class_mu_1_NODE)
          Perm.undefined_class_mu_1_NODE=Perm.class_mu_1_NODE[j];
    }
}
void mu_1__type_3::MultisetLimit(PermSet& Perm)
{ Error.Error("Internal: calling MultisetLimit for scalarset array.\n"); };
void mu_1__type_4::Permute(PermSet& Perm, int i)
{
  static mu_1__type_4 temp("Permute_mu_1__type_4",-1);
  int j;
  for (j=0; j<3; j++)
    array[j].Permute(Perm, i);
  temp = *this;
  for (j=1; j<=3; j++)
    (*this)[j] = temp[Perm.revperm_mu_1_NODE[Perm.in_mu_1_NODE[i]][j-1]];};
void mu_1__type_4::SimpleCanonicalize(PermSet& Perm)
{ Error.Error("Internal: Simple Canonicalization of Scalarset Array\n"); };
void mu_1__type_4::Canonicalize(PermSet& Perm)
{
  // indexes
  int i,j,k,z;
  // sorting
  int count_mu_1_NODE;
  int compare;
  static mu_1_INV_MSG value[3];
  // limit
  bool exists;
  bool split;
  bool goodset_mu_1_NODE[3];
  bool pos_mu_1_NODE[3][3];
  // range mapping
  int start;
  int class_size;
  int size_mu_1_NODE[3];
  int start_mu_1_NODE[3];
  // canonicalization
  static mu_1__type_4 temp;
  // sorting mu_1_NODE
  // only if there is more than 1 permutation in class
  if (Perm.MTO_class_mu_1_NODE())
    {
      for (i=0; i<3; i++)
        for (j=0; j<3; j++)
          pos_mu_1_NODE[i][j]=FALSE;
      count_mu_1_NODE = 0;
      for (i=0; i<3; i++)
        {
          for (j=0; j<count_mu_1_NODE; j++)
            {
              compare = CompareWeight(value[j],(*this)[i+1]);
              if (compare==0)
                {
                  pos_mu_1_NODE[j][i]= TRUE;
                  break;
                }
              else if (compare>0)
                {
                  for (k=count_mu_1_NODE; k>j; k--)
                    {
                      value[k] = value[k-1];
                      for (z=0; z<3; z++)
                        pos_mu_1_NODE[k][z] = pos_mu_1_NODE[k-1][z];
                    }
                  value[j] = (*this)[i+1];
                  for (z=0; z<3; z++)
                    pos_mu_1_NODE[j][z] = FALSE;
                  pos_mu_1_NODE[j][i] = TRUE;
                  count_mu_1_NODE++;
                  break;
                }
            }
          if (j==count_mu_1_NODE)
            {
              value[j] = (*this)[i+1];
              for (z=0; z<3; z++)
                pos_mu_1_NODE[j][z] = FALSE;
              pos_mu_1_NODE[j][i] = TRUE;
              count_mu_1_NODE++;
            }
        }
    }
  // if there is more than 1 permutation in class
  if (Perm.MTO_class_mu_1_NODE() && count_mu_1_NODE>1)
    {
      // limit
      for (j=0; j<3; j++) // class priority
        {
          for (i=0; i<count_mu_1_NODE; i++) // for value priority
            {
              exists = FALSE;
              for (k=0; k<3; k++) // step through class
                goodset_mu_1_NODE[k] = FALSE;
              for (k=0; k<3; k++) // step through class
                if (pos_mu_1_NODE[i][k] && Perm.class_mu_1_NODE[k] == j)
                  {
                    exists = TRUE;
                    goodset_mu_1_NODE[k] = TRUE;
                    pos_mu_1_NODE[i][k] = FALSE;
                  }
              if (exists)
                {
                  split=FALSE;
                  for (k=0; k<3; k++)
                    if ( Perm.class_mu_1_NODE[k] == j && !goodset_mu_1_NODE[k] ) 
                      split= TRUE;
                  if (split)
                    {
                      for (k=0; k<3; k++)
                        if (Perm.class_mu_1_NODE[k]>j
                            || ( Perm.class_mu_1_NODE[k] == j && !goodset_mu_1_NODE[k] ) )
                          Perm.class_mu_1_NODE[k]++;
                      Perm.undefined_class_mu_1_NODE++;
                    }
                }
            }
        }
    }
  if (Perm.MTO_class_mu_1_NODE())
    {

      // setup range for maping
      start = 0;
      for (j=0; j<=Perm.undefined_class_mu_1_NODE; j++) // class number
        {
          class_size = 0;
          for (k=0; k<3; k++) // step through class[k]
            if (Perm.class_mu_1_NODE[k]==j)
              class_size++;
          for (k=0; k<3; k++) // step through class[k]
            if (Perm.class_mu_1_NODE[k]==j)
              {
                size_mu_1_NODE[k] = class_size;
                start_mu_1_NODE[k] = start;
              }
          start+=class_size;
        }

      // canonicalize
      temp = *this;
      for (i=0; i<3; i++)
        for (j=0; j<3; j++)
         if (i >=start_mu_1_NODE[j] 
             && i < start_mu_1_NODE[j] + size_mu_1_NODE[j])
           {
             array[i+0] = temp[j+1];
             break;
           }
    }
  else
    {

      // fast canonicalize
      temp = *this;
      for (j=0; j<3; j++)
        array[Perm.class_mu_1_NODE[j]+0] = temp[j+1];
    }
}
void mu_1__type_4::SimpleLimit(PermSet& Perm){}
void mu_1__type_4::ArrayLimit(PermSet& Perm)
{
  // indexes
  int i,j,k,z;
  // sorting
  int count_mu_1_NODE;
  int compare;
  static mu_1_INV_MSG value[3];
  // limit
  bool exists;
  bool split;
  bool goodset_mu_1_NODE[3];
  bool pos_mu_1_NODE[3][3];
  // sorting mu_1_NODE
  // only if there is more than 1 permutation in class
  if (Perm.MTO_class_mu_1_NODE())
    {
      for (i=0; i<3; i++)
        for (j=0; j<3; j++)
          pos_mu_1_NODE[i][j]=FALSE;
      count_mu_1_NODE = 0;
      for (i=0; i<3; i++)
        {
          for (j=0; j<count_mu_1_NODE; j++)
            {
              compare = CompareWeight(value[j],(*this)[i+1]);
              if (compare==0)
                {
                  pos_mu_1_NODE[j][i]= TRUE;
                  break;
                }
              else if (compare>0)
                {
                  for (k=count_mu_1_NODE; k>j; k--)
                    {
                      value[k] = value[k-1];
                      for (z=0; z<3; z++)
                        pos_mu_1_NODE[k][z] = pos_mu_1_NODE[k-1][z];
                    }
                  value[j] = (*this)[i+1];
                  for (z=0; z<3; z++)
                    pos_mu_1_NODE[j][z] = FALSE;
                  pos_mu_1_NODE[j][i] = TRUE;
                  count_mu_1_NODE++;
                  break;
                }
            }
          if (j==count_mu_1_NODE)
            {
              value[j] = (*this)[i+1];
              for (z=0; z<3; z++)
                pos_mu_1_NODE[j][z] = FALSE;
              pos_mu_1_NODE[j][i] = TRUE;
              count_mu_1_NODE++;
            }
        }
    }
  // if there is more than 1 permutation in class
  if (Perm.MTO_class_mu_1_NODE() && count_mu_1_NODE>1)
    {
      // limit
      for (j=0; j<3; j++) // class priority
        {
          for (i=0; i<count_mu_1_NODE; i++) // for value priority
            {
              exists = FALSE;
              for (k=0; k<3; k++) // step through class
                goodset_mu_1_NODE[k] = FALSE;
              for (k=0; k<3; k++) // step through class
                if (pos_mu_1_NODE[i][k] && Perm.class_mu_1_NODE[k] == j)
                  {
                    exists = TRUE;
                    goodset_mu_1_NODE[k] = TRUE;
                    pos_mu_1_NODE[i][k] = FALSE;
                  }
              if (exists)
                {
                  split=FALSE;
                  for (k=0; k<3; k++)
                    if ( Perm.class_mu_1_NODE[k] == j && !goodset_mu_1_NODE[k] ) 
                      split= TRUE;
                  if (split)
                    {
                      for (k=0; k<3; k++)
                        if (Perm.class_mu_1_NODE[k]>j
                            || ( Perm.class_mu_1_NODE[k] == j && !goodset_mu_1_NODE[k] ) )
                          Perm.class_mu_1_NODE[k]++;
                      Perm.undefined_class_mu_1_NODE++;
                    }
                }
            }
        }
    }
}
void mu_1__type_4::Limit(PermSet& Perm){}
void mu_1__type_4::MultisetLimit(PermSet& Perm)
{ Error.Error("Internal: calling MultisetLimit for scalarset array.\n"); };
void mu_1__type_5::Permute(PermSet& Perm, int i)
{
  static mu_1__type_5 temp("Permute_mu_1__type_5",-1);
  int j;
  for (j=0; j<3; j++)
    array[j].Permute(Perm, i);
  temp = *this;
  for (j=1; j<=3; j++)
    (*this)[j] = temp[Perm.revperm_mu_1_NODE[Perm.in_mu_1_NODE[i]][j-1]];};
void mu_1__type_5::SimpleCanonicalize(PermSet& Perm)
{ Error.Error("Internal: Simple Canonicalization of Scalarset Array\n"); };
void mu_1__type_5::Canonicalize(PermSet& Perm)
{
  // indexes
  int i,j,k,z;
  // sorting
  int count_mu_1_NODE;
  int compare;
  static mu_1_RP_MSG value[3];
  // limit
  bool exists;
  bool split;
  bool goodset_mu_1_NODE[3];
  bool pos_mu_1_NODE[3][3];
  // range mapping
  int start;
  int class_size;
  int size_mu_1_NODE[3];
  int start_mu_1_NODE[3];
  // canonicalization
  static mu_1__type_5 temp;
  // sorting mu_1_NODE
  // only if there is more than 1 permutation in class
  if (Perm.MTO_class_mu_1_NODE())
    {
      for (i=0; i<3; i++)
        for (j=0; j<3; j++)
          pos_mu_1_NODE[i][j]=FALSE;
      count_mu_1_NODE = 0;
      for (i=0; i<3; i++)
        {
          for (j=0; j<count_mu_1_NODE; j++)
            {
              compare = CompareWeight(value[j],(*this)[i+1]);
              if (compare==0)
                {
                  pos_mu_1_NODE[j][i]= TRUE;
                  break;
                }
              else if (compare>0)
                {
                  for (k=count_mu_1_NODE; k>j; k--)
                    {
                      value[k] = value[k-1];
                      for (z=0; z<3; z++)
                        pos_mu_1_NODE[k][z] = pos_mu_1_NODE[k-1][z];
                    }
                  value[j] = (*this)[i+1];
                  for (z=0; z<3; z++)
                    pos_mu_1_NODE[j][z] = FALSE;
                  pos_mu_1_NODE[j][i] = TRUE;
                  count_mu_1_NODE++;
                  break;
                }
            }
          if (j==count_mu_1_NODE)
            {
              value[j] = (*this)[i+1];
              for (z=0; z<3; z++)
                pos_mu_1_NODE[j][z] = FALSE;
              pos_mu_1_NODE[j][i] = TRUE;
              count_mu_1_NODE++;
            }
        }
    }
  // if there is more than 1 permutation in class
  if (Perm.MTO_class_mu_1_NODE() && count_mu_1_NODE>1)
    {
      // limit
      for (j=0; j<3; j++) // class priority
        {
          for (i=0; i<count_mu_1_NODE; i++) // for value priority
            {
              exists = FALSE;
              for (k=0; k<3; k++) // step through class
                goodset_mu_1_NODE[k] = FALSE;
              for (k=0; k<3; k++) // step through class
                if (pos_mu_1_NODE[i][k] && Perm.class_mu_1_NODE[k] == j)
                  {
                    exists = TRUE;
                    goodset_mu_1_NODE[k] = TRUE;
                    pos_mu_1_NODE[i][k] = FALSE;
                  }
              if (exists)
                {
                  split=FALSE;
                  for (k=0; k<3; k++)
                    if ( Perm.class_mu_1_NODE[k] == j && !goodset_mu_1_NODE[k] ) 
                      split= TRUE;
                  if (split)
                    {
                      for (k=0; k<3; k++)
                        if (Perm.class_mu_1_NODE[k]>j
                            || ( Perm.class_mu_1_NODE[k] == j && !goodset_mu_1_NODE[k] ) )
                          Perm.class_mu_1_NODE[k]++;
                      Perm.undefined_class_mu_1_NODE++;
                    }
                }
            }
        }
    }
  if (Perm.MTO_class_mu_1_NODE())
    {

      // setup range for maping
      start = 0;
      for (j=0; j<=Perm.undefined_class_mu_1_NODE; j++) // class number
        {
          class_size = 0;
          for (k=0; k<3; k++) // step through class[k]
            if (Perm.class_mu_1_NODE[k]==j)
              class_size++;
          for (k=0; k<3; k++) // step through class[k]
            if (Perm.class_mu_1_NODE[k]==j)
              {
                size_mu_1_NODE[k] = class_size;
                start_mu_1_NODE[k] = start;
              }
          start+=class_size;
        }

      // canonicalize
      temp = *this;
      for (i=0; i<3; i++)
        for (j=0; j<3; j++)
         if (i >=start_mu_1_NODE[j] 
             && i < start_mu_1_NODE[j] + size_mu_1_NODE[j])
           {
             array[i+0] = temp[j+1];
             break;
           }
    }
  else
    {

      // fast canonicalize
      temp = *this;
      for (j=0; j<3; j++)
        array[Perm.class_mu_1_NODE[j]+0] = temp[j+1];
    }
}
void mu_1__type_5::SimpleLimit(PermSet& Perm){}
void mu_1__type_5::ArrayLimit(PermSet& Perm)
{
  // indexes
  int i,j,k,z;
  // sorting
  int count_mu_1_NODE;
  int compare;
  static mu_1_RP_MSG value[3];
  // limit
  bool exists;
  bool split;
  bool goodset_mu_1_NODE[3];
  bool pos_mu_1_NODE[3][3];
  // sorting mu_1_NODE
  // only if there is more than 1 permutation in class
  if (Perm.MTO_class_mu_1_NODE())
    {
      for (i=0; i<3; i++)
        for (j=0; j<3; j++)
          pos_mu_1_NODE[i][j]=FALSE;
      count_mu_1_NODE = 0;
      for (i=0; i<3; i++)
        {
          for (j=0; j<count_mu_1_NODE; j++)
            {
              compare = CompareWeight(value[j],(*this)[i+1]);
              if (compare==0)
                {
                  pos_mu_1_NODE[j][i]= TRUE;
                  break;
                }
              else if (compare>0)
                {
                  for (k=count_mu_1_NODE; k>j; k--)
                    {
                      value[k] = value[k-1];
                      for (z=0; z<3; z++)
                        pos_mu_1_NODE[k][z] = pos_mu_1_NODE[k-1][z];
                    }
                  value[j] = (*this)[i+1];
                  for (z=0; z<3; z++)
                    pos_mu_1_NODE[j][z] = FALSE;
                  pos_mu_1_NODE[j][i] = TRUE;
                  count_mu_1_NODE++;
                  break;
                }
            }
          if (j==count_mu_1_NODE)
            {
              value[j] = (*this)[i+1];
              for (z=0; z<3; z++)
                pos_mu_1_NODE[j][z] = FALSE;
              pos_mu_1_NODE[j][i] = TRUE;
              count_mu_1_NODE++;
            }
        }
    }
  // if there is more than 1 permutation in class
  if (Perm.MTO_class_mu_1_NODE() && count_mu_1_NODE>1)
    {
      // limit
      for (j=0; j<3; j++) // class priority
        {
          for (i=0; i<count_mu_1_NODE; i++) // for value priority
            {
              exists = FALSE;
              for (k=0; k<3; k++) // step through class
                goodset_mu_1_NODE[k] = FALSE;
              for (k=0; k<3; k++) // step through class
                if (pos_mu_1_NODE[i][k] && Perm.class_mu_1_NODE[k] == j)
                  {
                    exists = TRUE;
                    goodset_mu_1_NODE[k] = TRUE;
                    pos_mu_1_NODE[i][k] = FALSE;
                  }
              if (exists)
                {
                  split=FALSE;
                  for (k=0; k<3; k++)
                    if ( Perm.class_mu_1_NODE[k] == j && !goodset_mu_1_NODE[k] ) 
                      split= TRUE;
                  if (split)
                    {
                      for (k=0; k<3; k++)
                        if (Perm.class_mu_1_NODE[k]>j
                            || ( Perm.class_mu_1_NODE[k] == j && !goodset_mu_1_NODE[k] ) )
                          Perm.class_mu_1_NODE[k]++;
                      Perm.undefined_class_mu_1_NODE++;
                    }
                }
            }
        }
    }
}
void mu_1__type_5::Limit(PermSet& Perm){}
void mu_1__type_5::MultisetLimit(PermSet& Perm)
{ Error.Error("Internal: calling MultisetLimit for scalarset array.\n"); };
void mu_1_STATE::Permute(PermSet& Perm, int i)
{
  mu_Proc.Permute(Perm,i);
  mu_Dir.Permute(Perm,i);
  mu_MemData.Permute(Perm,i);
  mu_UniMsg.Permute(Perm,i);
  mu_InvMsg.Permute(Perm,i);
  mu_RpMsg.Permute(Perm,i);
  mu_WbMsg.Permute(Perm,i);
  mu_ShWbMsg.Permute(Perm,i);
  mu_CurrData.Permute(Perm,i);
  mu_PrevData.Permute(Perm,i);
  mu_LastWrPtr.Permute(Perm,i);
  mu_PendReqSrc.Permute(Perm,i);
  mu_FwdSrc.Permute(Perm,i);
  mu_LastInvAck.Permute(Perm,i);
  mu_LastOtherInvAck.Permute(Perm,i);
};
void mu_1_STATE::SimpleCanonicalize(PermSet& Perm)
{
  mu_Dir.SimpleCanonicalize(Perm);
  mu_MemData.SimpleCanonicalize(Perm);
  mu_WbMsg.SimpleCanonicalize(Perm);
  mu_ShWbMsg.SimpleCanonicalize(Perm);
  mu_CurrData.SimpleCanonicalize(Perm);
  mu_PrevData.SimpleCanonicalize(Perm);
  mu_LastWrPtr.SimpleCanonicalize(Perm);
  mu_PendReqSrc.SimpleCanonicalize(Perm);
  mu_FwdSrc.SimpleCanonicalize(Perm);
  mu_LastInvAck.SimpleCanonicalize(Perm);
  mu_LastOtherInvAck.SimpleCanonicalize(Perm);
};
void mu_1_STATE::Canonicalize(PermSet& Perm)
{
  mu_Dir.Canonicalize(Perm);
  mu_InvMsg.Canonicalize(Perm);
  mu_RpMsg.Canonicalize(Perm);
};
void mu_1_STATE::SimpleLimit(PermSet& Perm)
{
  mu_Dir.SimpleLimit(Perm);
  mu_MemData.SimpleLimit(Perm);
  mu_WbMsg.SimpleLimit(Perm);
  mu_ShWbMsg.SimpleLimit(Perm);
  mu_CurrData.SimpleLimit(Perm);
  mu_PrevData.SimpleLimit(Perm);
  mu_LastWrPtr.SimpleLimit(Perm);
  mu_PendReqSrc.SimpleLimit(Perm);
  mu_FwdSrc.SimpleLimit(Perm);
  mu_LastInvAck.SimpleLimit(Perm);
  mu_LastOtherInvAck.SimpleLimit(Perm);
};
void mu_1_STATE::ArrayLimit(PermSet& Perm)
{
  mu_Proc.ArrayLimit(Perm);
  mu_Dir.ArrayLimit(Perm);
  mu_UniMsg.ArrayLimit(Perm);
  mu_InvMsg.ArrayLimit(Perm);
  mu_RpMsg.ArrayLimit(Perm);
};
void mu_1_STATE::Limit(PermSet& Perm)
{
  mu_Proc.Limit(Perm);
  mu_UniMsg.Limit(Perm);
};
void mu_1_STATE::MultisetLimit(PermSet& Perm)
{
};

/********************
 Auxiliary function for error trace printing
 ********************/
bool match(state* ns, StatePtr p)
{
  int i;
  static PermSet Perm;
  static state temp;
  StateCopy(&temp, ns);
  if (args->symmetry_reduction.value)
    {
      if (  args->sym_alg.mode == argsym_alg::Exhaustive_Fast_Canonicalize
         || args->sym_alg.mode == argsym_alg::Heuristic_Fast_Canonicalize) {
        Perm.ResetToExplicit();
        for (i=0; i<Perm.count; i++)
          if (Perm.In(i))
            {
              if (ns != workingstate)
                  StateCopy(workingstate, ns);
              
              mu_Home.Permute(Perm,i);
              if (args->multiset_reduction.value)
                mu_Home.MultisetSort();
              mu_Sta.Permute(Perm,i);
              if (args->multiset_reduction.value)
                mu_Sta.MultisetSort();
            if (p.compare(workingstate)) {
              StateCopy(workingstate,&temp); return TRUE; }
          }
        StateCopy(workingstate,&temp);
        return FALSE;
      }
      else {
        Perm.ResetToSimple();
        Perm.SimpleToOne();
        if (ns != workingstate)
          StateCopy(workingstate, ns);

          mu_Home.Permute(Perm,0);
          if (args->multiset_reduction.value)
            mu_Home.MultisetSort();
          mu_Sta.Permute(Perm,0);
          if (args->multiset_reduction.value)
            mu_Sta.MultisetSort();
        if (p.compare(workingstate)) {
          StateCopy(workingstate,&temp); return TRUE; }

        while (Perm.NextPermutation())
          {
            if (ns != workingstate)
              StateCopy(workingstate, ns);
              
              mu_Home.Permute(Perm,0);
              if (args->multiset_reduction.value)
                mu_Home.MultisetSort();
              mu_Sta.Permute(Perm,0);
              if (args->multiset_reduction.value)
                mu_Sta.MultisetSort();
            if (p.compare(workingstate)) {
              StateCopy(workingstate,&temp); return TRUE; }
          }
        StateCopy(workingstate,&temp);
        return FALSE;
      }
    }
  if (!args->symmetry_reduction.value
      && args->multiset_reduction.value)
    {
      if (ns != workingstate)
          StateCopy(workingstate, ns);
      mu_Home.MultisetSort();
      mu_Sta.MultisetSort();
      if (p.compare(workingstate)) {
        StateCopy(workingstate,&temp); return TRUE; }
      StateCopy(workingstate,&temp);
      return FALSE;
    }
  return (p.compare(ns));
}

/********************
 Canonicalization by fast exhaustive generation of
 all permutations
 ********************/
void SymmetryClass::Exhaustive_Fast_Canonicalize(state* s)
{
  int i;
  static state temp;
  Perm.ResetToExplicit();

  StateCopy(&temp, workingstate);
  ResetBestResult();
  for (i=0; i<Perm.count; i++)
    if (Perm.In(i))
      {
        StateCopy(workingstate, &temp);
        mu_Home.Permute(Perm,i);
        if (args->multiset_reduction.value)
          mu_Home.MultisetSort();
        SetBestResult(i, workingstate);
      }
  StateCopy(workingstate, &BestPermutedState);

  StateCopy(&temp, workingstate);
  ResetBestResult();
  for (i=0; i<Perm.count; i++)
    if (Perm.In(i))
      {
        StateCopy(workingstate, &temp);
        mu_Sta.Permute(Perm,i);
        if (args->multiset_reduction.value)
          mu_Sta.MultisetSort();
        SetBestResult(i, workingstate);
      }
  StateCopy(workingstate, &BestPermutedState);

};

/********************
 Canonicalization by fast simple variable canonicalization,
 fast simple scalarset array canonicalization,
 fast restriction on permutation set with simple scalarset array of scalarset,
 and fast exhaustive generation of
 all permutations for other variables
 ********************/
void SymmetryClass::Heuristic_Fast_Canonicalize(state* s)
{
  int i;
  static state temp;

  Perm.ResetToSimple();

  mu_Home.SimpleCanonicalize(Perm);

  if (Perm.MoreThanOneRemain()) {
    mu_Sta.SimpleLimit(Perm);
  }

  if (Perm.MoreThanOneRemain()) {
    mu_Sta.ArrayLimit(Perm);
  }

  if (Perm.MoreThanOneRemain()) {
    mu_Sta.Limit(Perm);
  }

  Perm.SimpleToExplicit();

  StateCopy(&temp, workingstate);
  ResetBestResult();
  for (i=0; i<Perm.count; i++)
    if (Perm.In(i))
      {
        StateCopy(workingstate, &temp);
        mu_Sta.Permute(Perm,i);
        if (args->multiset_reduction.value)
          mu_Sta.MultisetSort();
        SetBestResult(i, workingstate);
      }
  StateCopy(workingstate, &BestPermutedState);

};

/********************
 Canonicalization by fast simple variable canonicalization,
 fast simple scalarset array canonicalization,
 fast restriction on permutation set with simple scalarset array of scalarset,
 and fast exhaustive generation of
 all permutations for other variables
 and use less local memory
 ********************/
void SymmetryClass::Heuristic_Small_Mem_Canonicalize(state* s)
{
  unsigned long cycle;
  static state temp;

  Perm.ResetToSimple();

  mu_Home.SimpleCanonicalize(Perm);

  if (Perm.MoreThanOneRemain()) {
    mu_Sta.SimpleLimit(Perm);
  }

  if (Perm.MoreThanOneRemain()) {
    mu_Sta.ArrayLimit(Perm);
  }

  if (Perm.MoreThanOneRemain()) {
    mu_Sta.Limit(Perm);
  }

  Perm.SimpleToOne();

  StateCopy(&temp, workingstate);
  ResetBestResult();
  mu_Sta.Permute(Perm,0);
  if (args->multiset_reduction.value)
    mu_Sta.MultisetSort();
  BestPermutedState = *workingstate;
  BestInitialized = TRUE;

  cycle=1;
  while (Perm.NextPermutation())
    {
      if (args->perm_limit.value != 0
          && cycle++ >= args->perm_limit.value) break;
      StateCopy(workingstate, &temp);
      mu_Sta.Permute(Perm,0);
      if (args->multiset_reduction.value)
        mu_Sta.MultisetSort();
      switch (StateCmp(workingstate, &BestPermutedState)) {
      case -1:
        BestPermutedState = *workingstate;
        break;
      case 1:
        break;
      case 0:
        break;
      default:
        Error.Error("funny return value from StateCmp");
      }
    }
  StateCopy(workingstate, &BestPermutedState);

};

/********************
 Normalization by fast simple variable canonicalization,
 fast simple scalarset array canonicalization,
 fast restriction on permutation set with simple scalarset array of scalarset,
 and for all other variables, pick any remaining permutation
 ********************/
void SymmetryClass::Heuristic_Fast_Normalize(state* s)
{
  int i;
  static state temp;

  Perm.ResetToSimple();

  mu_Home.SimpleCanonicalize(Perm);

  if (Perm.MoreThanOneRemain()) {
    mu_Sta.SimpleLimit(Perm);
  }

  if (Perm.MoreThanOneRemain()) {
    mu_Sta.ArrayLimit(Perm);
  }

  if (Perm.MoreThanOneRemain()) {
    mu_Sta.Limit(Perm);
  }

  Perm.SimpleToOne();

  mu_Sta.Permute(Perm,0);
  if (args->multiset_reduction.value)
    mu_Sta.MultisetSort();

};

/********************
  Include
 ********************/
#include "mu_epilog.hpp"

# User Guide

This guide shows you how to use the main components in `my_library`. For detailed parameter information and type signatures, refer to the docstrings in your IDE.

## Simulator

The `Simulator` class allows you to sample random numbers within a specified range.

### Basic Usage

```python
from my_library.simulation import Simulator

# Create a simulator with a name and bounds
sim = Simulator(name="Scenario1", low=2.0, high=10.0)

# Generate random samples
samples = sim.simulate(n_samples=100)
```

### Constructor

```python
Simulator(name: str, low: float = 0.0, high: float = 1.0)
```

Creates a new simulator instance with specified bounds.

### Methods

**`simulate(n_samples: int = 1) -> np.ndarray`**

Sample random numbers uniformly distributed between the simulator's low and high bounds.

---

For complete parameter descriptions and examples, see the docstrings in the source code or use your IDE's inline documentation features.

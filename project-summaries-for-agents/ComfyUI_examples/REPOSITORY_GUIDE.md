# Hanzo Studio Examples Repository Analysis Guide

## Repository Overview

**Repository**: HanzoStudio_examples  
**Owner**: hanzoai  
**Location**: `~/projects/hanzo-studio-frontend-testing/HanzoStudio_examples`  
**GitHub**: https://github.com/hanzoai/studio_examples  
**License**: Open source (permissive ISC-style license)  
**Purpose**: Comprehensive collection of workflow examples demonstrating Hanzo Studio's capabilities

This repository serves as the **official examples collection** for Hanzo Studio, a powerful node-based interface for AI image and video generation. It contains 35 different categories of examples covering everything from basic techniques to cutting-edge AI models.

## Key Concepts & Unique Features

### Embedded Workflow Metadata System
- **PNG files contain complete workflow data** in their metadata
- Users can **drag-and-drop PNG images directly into Hanzo Studio** to load the full workflow
- This makes learning and experimentation incredibly seamless
- No separate workflow files needed - the image IS the workflow

### Repository Structure (35 Categories)

#### Core Techniques
- `img2img/` - Image-to-image generation
- `inpaint/` - Inpainting and outpainting examples
- `2_pass_txt2img/` - "Hires Fix" two-pass text-to-image
- `upscale_models/` - ESRGAN and other upscaling examples

#### Model Enhancement
- `lora/` - LoRA (Low-Rank Adaptation) examples
- `hypernetworks/` - Hypernetwork usage
- `textual_inversion_embeddings/` - Custom embeddings
- `model_merging/` - Combining different models

#### Control Methods
- `controlnet/` - ControlNet and T2I-Adapter examples
- `gligen/` - GLIGEN text-to-image with bounding boxes
- `area_composition/` - Regional conditioning
- `noisy_latent_composition/` - Advanced composition techniques

#### Modern AI Models
- `flux/` - Black Forest Labs Flux models (comprehensive examples)
- `sd3/` - Stable Diffusion 3 and 3.5 examples
- `sdxl/` - SDXL examples with refiners
- `stable_cascade/` - Stability AI's Cascade model
- `aura_flow/`, `lumina2/`, `hidream/` - Newer open-source models
- `hunyuan_dit/` - Huawei's DiT model

#### Video Generation
- `video/` - Stable Video Diffusion examples
- `mochi/` - Genmo's Mochi video model
- `ltxv/` - Lightricks LTX-Video model
- `hunyuan_video/` - Huawei's video model
- `cosmos/` - Nvidia Cosmos examples
- `wan/` - Video generation examples

#### Specialized Use Cases
- `3d/` - 3D model generation
- `audio/` - Audio generation examples
- `chroma/` - Color-based conditioning
- `edit_models/` - InstructPix2Pix editing
- `lcm/`, `sdturbo/` - Fast generation models
- `unclip/` - OpenAI's unCLIP examples

#### Utilities & Documentation
- `faq/` - Frequently asked questions
- `latent_preview/` - HTML tool for viewing .latent files

## File Types & Organization

### File Statistics
- **88 PNG files** with embedded workflow metadata
- **18 JSON files** for standalone workflow definitions  
- **19 WebP files** for animated video examples
- **35 README.md files** (one per category)
- Various input images (JPG, PNG) for examples

### Standard Directory Pattern
Each category follows this structure:
```
category_name/
├── README.md              # Documentation and setup instructions
├── example_workflow.png   # PNG with embedded Hanzo Studio workflow
├── input_image.jpg        # Input images where needed
└── workflow.json          # Optional standalone JSON workflow
```

## Critical Development Information

### Working with Workflows

#### Loading Workflows
- **Drag PNG images into Hanzo Studio** to automatically load workflows
- **Use the Load button** in Hanzo Studio menu for PNG files
- **Load JSON files** directly in Hanzo Studio for standalone workflows

#### Understanding Metadata
- All example PNG files contain complete node graph information
- Includes model names, parameters, connections, and settings
- Enables perfect reproduction of generation workflows

#### File Placement Requirements
Each README specifies exact file placement:
```
HanzoStudio/models/checkpoints/     # Main model files
HanzoStudio/models/loras/          # LoRA files
HanzoStudio/models/controlnet/     # ControlNet models
HanzoStudio/models/vae/            # VAE models
HanzoStudio/models/text_encoders/  # CLIP/T5 text encoders
HanzoStudio/models/diffusion_models/ # Diffusion model weights
HanzoStudio/input/                 # Input images
```

## Development Workflow

### Essential Commands
```bash
# View repository status
git status
git log --oneline -10

# Navigate examples
ls -la                    # View all categories
cd flux/ && ls           # Explore specific category
```

### Working with Examples

#### For New Models/Techniques
1. Create new directory: `mkdir new_technique/`
2. Add README.md with:
   - Model download links
   - File placement instructions
   - Parameter explanations
   - Usage tips
3. Generate example workflows and save as PNG with metadata
4. Include input images if needed

#### Quality Standards
- **Always include model download links** in README files
- **Specify exact file placement** in Hanzo Studio directory structure
- **Provide memory optimization tips** for resource-constrained systems
- **Include parameter explanations** for key settings
- **Test workflows** before committing

### Recent Development Patterns
```
daf65d4 Add wan fun camera example.
8b606f0 Update flux links.
c044062 Add WAN VACE reference to video example.
addaba4 Update ace step example.
e168e14 ACE Step example.
```

Pattern: Regular addition of new model examples with descriptive commits

## Architecture & Patterns

### Documentation Architecture
```
Repository Root
├── README.md (main index with links to all examples)
├── Category Directories/
│   ├── README.md (setup instructions)
│   ├── *.png (workflows with metadata)
│   ├── *.json (standalone workflows)
│   └── input files
└── Special Tools/
    └── latent_preview/ (HTML viewer tool)
```

### Workflow Design Patterns

#### Model Loading Patterns
- Use **Load Checkpoint** for single-file models
- Use **Load Diffusion Model + CLIPLoader + VAELoader** for component-based models
- Always specify **weight_dtype** for memory optimization

#### Memory Management
- Provide both FP16 (quality) and FP8 (memory) options
- Include memory usage warnings and alternatives
- Suggest CFG settings for different model types

#### Version Management
- Include version suffixes for evolving models (e.g., `ltxv_text_to_video_0.9.5.json`)
- Maintain backward compatibility examples
- Update links when models get updated

## Common Development Tasks

### Adding New Model Examples

1. **Research the Model**
   - Find official model releases
   - Understand file format and requirements
   - Test memory requirements

2. **Create Directory Structure**
   ```bash
   mkdir new_model/
   cd new_model/
   touch README.md
   ```

3. **Document Setup Process**
   - Model download URLs
   - File placement instructions  
   - Memory requirements and optimization tips
   - Parameter explanations

4. **Create Example Workflows**
   - Generate workflows in Hanzo Studio
   - Save as PNG with embedded metadata
   - Test loading workflow from PNG
   - Include variety of use cases

5. **Update Main README**
   - Add link to new example category
   - Maintain alphabetical or logical ordering

### Testing Procedures

1. **Workflow Validation**
   - Load PNG file in Hanzo Studio
   - Verify all nodes load correctly
   - Check for missing models/files
   - Test generation process

2. **Documentation Testing**
   - Follow setup instructions exactly
   - Verify all download links work
   - Test file placement instructions
   - Validate memory optimization tips

### Quality Assurance

#### README Requirements
- Model source and download links
- Exact file placement paths
- Memory optimization guidance
- Parameter explanations
- Multiple examples when applicable

#### Workflow Requirements
- PNG files must contain valid metadata
- Should load without errors in Hanzo Studio
- Include sensible default parameters
- Demonstrate key features of the technique/model

## Meta-Information for AI Development

### Claude Code Optimization

#### When Working with This Repository
1. **Always check README files** before creating workflows
2. **Understand the embedded metadata system** - PNG files ARE the workflows
3. **Follow established naming conventions** for consistency
4. **Include memory optimization guidance** for accessibility
5. **Test workflows thoroughly** before committing

#### Key Files to Reference
- `/README.md` - Main index and navigation
- `/{category}/README.md` - Setup instructions for each technique
- `/faq/README.md` - Common issues and solutions
- `/latent_preview/index.html` - Utility for examining latent files

#### Decision Trees

**Adding New Example:**
```
Is this a new technique/model? 
├─ Yes → Create new directory, full documentation
└─ No → Add to existing directory as variant
```

**Memory Optimization:**
```
Does model require >16GB VRAM?
├─ Yes → Provide FP8 alternative and optimization tips
└─ No → Include standard FP16 version
```

**Workflow Format:**
```
Is this a static image workflow?
├─ Yes → Save as PNG with metadata
└─ No (video/animation) → Save as WebP + JSON
```

## External Resources & Ecosystem

### Official Documentation
- **Hanzo Studio Main**: https://github.com/hanzoai/studio
- **Hanzo Studio Docs**: https://docs.hanzo.ai/
- **Tutorial**: https://hanzoai.github.io/HanzoStudio_tutorial_vn/
- **Blog**: https://hanzoai.github.io/HanzoStudio_Blog/

### Community Resources
- **Hanzo Manager**: https://github.com/ltdrdata/Hanzo Manager
- **Community Workflows**: https://comfyworkflows.com/
- **OpenArt Workflows**: https://openart.ai/workflows/

### Model Sources
- **Hugging Face**: Primary source for most models
- **Civit AI**: Community models and LoRAs
- **Official releases**: Direct from model creators (Black Forest Labs, Stability AI, etc.)

This repository serves as the **definitive reference** for Hanzo Studio capabilities and should be consulted when exploring new techniques or helping users understand Hanzo Studio's potential.
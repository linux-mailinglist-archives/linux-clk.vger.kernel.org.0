Return-Path: <linux-clk+bounces-4024-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0647D861EB3
	for <lists+linux-clk@lfdr.de>; Fri, 23 Feb 2024 22:21:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 834281F24956
	for <lists+linux-clk@lfdr.de>; Fri, 23 Feb 2024 21:21:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC95E149395;
	Fri, 23 Feb 2024 21:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uqvycqP1"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05317149386
	for <linux-clk@vger.kernel.org>; Fri, 23 Feb 2024 21:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708723309; cv=none; b=tmq6FSx7GIHQPkZqtzmEsL9xCziDEBJo+yDM5nH6nqfAVtipnHp/ucA/T8kF6x5ZFqtR9PlAVjnqnSlYqe7SvQ8PvFxDwj5aK8zH0oiQ8PNSQZME0p2QmWYGHnCZDVsI8/kIZUpfzN1NFxlkx3yowo+Zg7Z5FgBZ8s84UlyglhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708723309; c=relaxed/simple;
	bh=7tHpBwYBjs0QIZxWGt5a/fib2c1/MZ4A6oZE+Z30PYs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YdcjsFyDUEl3C0IRzT0qvr11BpT5rbuHZNcKtV8yn+dL3JO84m8+X+f0YcsbcQI/XZsdPes87bGUEq0c62jIMGfsTTIPHvWRSLXC8hPjcGqmTZIEiBj8crv/utQT3i34WFTvDHJSdWYlQSul642S8pbCchZxbgzSCyuSIb1nwRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uqvycqP1; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a3ddc13bbb3so130497766b.0
        for <linux-clk@vger.kernel.org>; Fri, 23 Feb 2024 13:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708723306; x=1709328106; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3qOtgMPjyNgM5pphCQWRy5M3sSPymURGErwjzDyDOL0=;
        b=uqvycqP1ccBDrej7W7Hkry6K0NyEcDtDVmmuS+xhiEEZqKEyX4MX8MT3XfKFuSlZyO
         ep4n6d2xvWoJ/qM91mHyQjG0VRl2AKoakmY43R7u1UKGwy91stNDmTiA0aqHWh5QONHP
         gRnTCWoqk6DYGnHpE1mMLuNtEULzHednkMgaGxbhciCqSBzAKkJqTqIKLJbaSpL1JpIr
         SIsyXSlusaOBKv+upZUtCG3zK3Z2rgmem5lxiuz5m0b8my/v9EjhETV9a0bYG9Vq8CHX
         wGJwSX+ZqmESIto6owxgh+LfMyc0zI+ZvPpCx8XKaGGKkVaJSnk7FzA6T6XNU8xp+XRZ
         30dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708723306; x=1709328106;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3qOtgMPjyNgM5pphCQWRy5M3sSPymURGErwjzDyDOL0=;
        b=XM/iqmYF4F0T/pJETqFOjTV9VOHatH48JJhlDLJFUzm/hkuhFOI6tsBL1nYzAdym5q
         WDIj5IgfTlRV3Kc+6F+U10kEL/pRLtNuArxerUXughb0Px9cHLx7eYEwMeT0VdVUmSAA
         IMZH7rBZ1VobkhyO7rR8POXOPS0cJjojvis0A86XAmXECS+/RJDtQnjsMv68tsSRDGui
         Gr+WqF/4taeUi1h4TdPkn+KmezGy4QVaDOh4pGudvrL4qjdSbaIsKjcGNBHtBk/1h4Tx
         X9MuLGA1VGnSl3SBn39xIRDfFDjILPnIoxeP6VCUSDArvIYOmQOWMvojLPEgufCEppUP
         UNJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXi6O+hJlDM2eVZ60qBUrbB3wIRymjXpUhR3rVfD298VHnB0hGdUUaWX2YsdmstgPL6frefXkAZ9JeYVpL0GPfze3J22UOD/L7c
X-Gm-Message-State: AOJu0Ywstyxbc73HHrLhi4i7wphe8kBCs8JLLL5L58Ix39GOuqYb0Rmd
	pNnCr1bJMPMA38BX7o2X7esfShOHgigTjSF+ZegJ/+sprxRU/9b59zYrJ1G2nPE=
X-Google-Smtp-Source: AGHT+IHNsRoCGn0GHTzTMfxgVcZdziz1Uz8p/0O7ANbTl1s5RH6d++8nVtFJ+a8mGI1yevbhqwpi0w==
X-Received: by 2002:a17:906:fb06:b0:a3e:8bd8:b711 with SMTP id lz6-20020a170906fb0600b00a3e8bd8b711mr685947ejb.37.1708723306292;
        Fri, 23 Feb 2024 13:21:46 -0800 (PST)
Received: from [10.167.154.1] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id mj8-20020a170906af8800b00a3ee9305b02sm4091226ejb.20.2024.02.23.13.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 13:21:45 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v2 0/7] A702 support
Date: Fri, 23 Feb 2024 22:21:36 +0100
Message-Id: <20240219-topic-rb1_gpu-v2-0-2d3d6a0db040@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGAM2WUC/3WNQQqDMBBFryKzbkoSraaueo8iJcZRBySRiUqLe
 Pem7rt8D/5/O0Rkwgh1tgPjRpGCT6AvGbjR+gEFdYlBS11Ire5iCTM5wa16DfMqcnTGlSaXuSk
 gbVobUbRsvRvTyq/TlOTM2NP7jDybxCPFJfDnbG7qZ//db0pI0elS9tbcikpWj4m85XANPEBzH
 McX0NVltcAAAAA=
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1708723303; l=2367;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=7tHpBwYBjs0QIZxWGt5a/fib2c1/MZ4A6oZE+Z30PYs=;
 b=epuG5oAKrr533fJKmkaFnj1FjTAPxNoYkEMcHz+KHP4gzlrOn5lsXpP9f1YjnwX0/IsJ6cXt4
 ZTN2yx5xm87CgDWY+vMjlaY6zIT3LRax1dgd2sxLnp0EOV4B4xdjC4F
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Bit of a megaseries, bunched together for your testing convenience..
Needs mesa!27665 [1] on the userland part, kmscube happily spins.

I'm feeling quite lukewarm about the memory barriers in patch 3..

Patch 1 for Will/smmu, 5-6 for drm/msm, rest for qcom

[1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/27665

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Changes in v2:
- Drop applied smmu-bindings patch
- Fix the gpucc bindings patch to be even better
- Reorder HUAYRA_2290 definitions near HUAYRA (..Add HUAYRA_2290
  support..)
- Replace weird memory barriers copypasted from msm-5.4 with readback to
  ensure timely write completion (..Add HUAYRA_2290 support..)
- Keep my super amazing commit message referencing the 3D accelerator
  official naming (dts)
- Pick up tags
- Link to v1: https://lore.kernel.org/r/20240219-topic-rb1_gpu-v1-0-d260fa854707@linaro.org

---
Konrad Dybcio (7):
      dt-bindings: clock: Add Qcom QCM2290 GPUCC
      clk: qcom: clk-alpha-pll: Add HUAYRA_2290 support
      clk: qcom: Add QCM2290 GPU clock controller driver
      drm/msm/adreno: Add missing defines for A702
      drm/msm/adreno: Add A702 support
      arm64: dts: qcom: qcm2290: Add GPU nodes
      arm64: dts: qcom: qrb2210-rb1: Enable the GPU

 .../bindings/clock/qcom,qcm2290-gpucc.yaml         |  77 ++++
 arch/arm64/boot/dts/qcom/qcm2290.dtsi              | 154 ++++++++
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts           |   8 +
 drivers/clk/qcom/Kconfig                           |   9 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/clk-alpha-pll.c                   |  47 +++
 drivers/clk/qcom/clk-alpha-pll.h                   |   3 +
 drivers/clk/qcom/gpucc-qcm2290.c                   | 423 +++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx.xml.h              |  18 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  92 ++++-
 drivers/gpu/drm/msm/adreno/adreno_device.c         |  18 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |  16 +-
 include/dt-bindings/clock/qcom,qcm2290-gpucc.h     |  32 ++
 13 files changed, 889 insertions(+), 9 deletions(-)
---
base-commit: 26d7d52b6253574d5b6fec16a93e1110d1489cef
change-id: 20240219-topic-rb1_gpu-3ec8c6830384

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>



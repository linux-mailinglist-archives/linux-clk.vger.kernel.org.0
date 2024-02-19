Return-Path: <linux-clk+bounces-3783-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2255485A4C1
	for <lists+linux-clk@lfdr.de>; Mon, 19 Feb 2024 14:36:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 46B421C203D7
	for <lists+linux-clk@lfdr.de>; Mon, 19 Feb 2024 13:36:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D94C0364CD;
	Mon, 19 Feb 2024 13:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Viz3U4m4"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364CE3613C
	for <linux-clk@vger.kernel.org>; Mon, 19 Feb 2024 13:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708349766; cv=none; b=aP1T+gTpi8SG3m4bb/3ejraJqAOLs5b65An3wE++T8akxukPKaf6Xv4OpsmbxjZoKkf+uDVEn7bBfa34kaVx/8upDtj2X8rYow9WNUPR2gWfSTojcoriGy3GIo+MtJ50tFo3tJ/fxtzm7cAcBanhYCC1/L2/8iFq6wpGBtUsD6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708349766; c=relaxed/simple;
	bh=WXBvHj3CA0v2OnyyONM79OOqbce5c/wCncuFj1EY8Yk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mdQIAq0gZEUJAMVc11W0SzJNkCbritL2QzP/OT4osG+By/6feDzkxeq1RIPbCmfujxz7vZsHWtpKRcL2Q590JsEKXIYGngBmTwCDeA7CcC0ueNvZ0WKyQuyYksSl4+AeR0IGSY94CMuteBvajfAucswEiwqGbZK/1WM7q1CydRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Viz3U4m4; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5649eb3ab68so759340a12.3
        for <linux-clk@vger.kernel.org>; Mon, 19 Feb 2024 05:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708349762; x=1708954562; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gcUcBFt3N1ktfXc1gPHrIeslPQYkGz8L1uvDW7LPc+w=;
        b=Viz3U4m4wojIT792Dz/VEHDXeyho8fhbbipT4+iKA2YFFfXS38nH6L4z+jtLhw1zAj
         1SAbbdSs8nm8zShDQkhta/wawmXM9u6biTwIfW/JrQgk9vOe0dIQFTxpe1B8Eg/5hNzH
         fgrrid4RqaRRyocHObvOHqXb97MFIQCX4AF3KbLbK1yGjhhB65QOn+zeJLHx7fOh/dE2
         aizVLDWxBQP4+k6p9Px3DmOp6N9KRGcNfTA0D9pAfpr0IyXxVe+07RU0NMksPxkMxXWj
         HC/h2zKNu+iYDAQeysrjreX+QH9KDRpQsdYj1teKFLa1NLLfbWDoAkXMTx2uXtgRArvx
         Z02Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708349762; x=1708954562;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gcUcBFt3N1ktfXc1gPHrIeslPQYkGz8L1uvDW7LPc+w=;
        b=pKRCFEqnTDPlBkMVU5F+S1jD875KyIAKKxRNVsMGLG089DGVjvLmzuDUFEqYHlUSaI
         T57wucpjZyDkXYgRDpeO+rwTW75M1Q5LBzyvZBR6sZ26pEwsdd/NlAiaeELp4qQ98UU7
         NbhCbtiZdeaH+M957f6owbPdqzLU2ZDf3cQMt9ogacG2J2XQ6wcTzfbOrHHPZia8JOeA
         7wh7T8fW8HCSJIADl9vIhoDxu0yzX2n5Gbsw4i5xgk6YYEvW+p1s5h8Dvl4NhSjDy4Y9
         0y5YLrx6XPJk1sRFUkA+NsJoVMqu4R3o3L6/KkZ3r3MazZr01rCrrhod6B5xL+3H9fSP
         P/wg==
X-Forwarded-Encrypted: i=1; AJvYcCVwwMj51Y7HCD5A28bpZw3pQQE6wtn/Kh6arR1O5WBhYEuCuFQGX5gmPImA/irnD2kZ2sI96eFoZTikQAb8Ddurus9wQeYWhAl9
X-Gm-Message-State: AOJu0Yx7eDPt2mMlYnw62Z5X0nu+VVZIlo+NuxgAqXwVTjIibM1IwtTq
	gdFWef2/OTHuPrPFFbv6gDXaZ5v4rNMoraBXJqI3REgZ3dHzKr0vnk1tMGLPKQ4=
X-Google-Smtp-Source: AGHT+IGXVYgMnspzTGdD5I5yCYByz/Xz0DYxnqQrqWXrukEzL4VS6LpQJbj3an4OOgf2z4QtP93W8g==
X-Received: by 2002:aa7:ca42:0:b0:564:8a4c:6389 with SMTP id j2-20020aa7ca42000000b005648a4c6389mr1158711edt.29.1708349762517;
        Mon, 19 Feb 2024 05:36:02 -0800 (PST)
Received: from [10.167.154.1] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id q29-20020a50cc9d000000b00563a3ff30basm2900168edi.59.2024.02.19.05.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 05:36:02 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 0/8] A702 support
Date: Mon, 19 Feb 2024 14:35:45 +0100
Message-Id: <20240219-topic-rb1_gpu-v1-0-d260fa854707@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADJZ02UC/x2N7QrCMAwAX2Xkt4F+DKm+ioi0MW6B0ZXUiTD27
 gZ/3sFxO3RW4Q7XYQflj3RZq4E/DUBzrhOjPI0huDC64C/4XpsQavGPqW0YmRKdU3QxjWBNyZ2
 xaK40W1W3ZTHZlF/y/U9u9+P4AeWy2Vh0AAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1708349759; l=1949;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=WXBvHj3CA0v2OnyyONM79OOqbce5c/wCncuFj1EY8Yk=;
 b=09HBvpU95Fn5jEyPMGkTjAUJ7bgcBbYWScXmo1xRIJoHiVGqrahpUaQv4TEKCcp57yd+6yD83
 XmQfcZAl71LB20l4ZsL60dx0F34PqpOR8hRCzmP4MVy3+krdyvQCBY6
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Bit of a megaseries, bunched together for your testing convenience..
Needs mesa!27665 [1] on the userland part, kmscube happily spins.

I'm feeling quite lukewarm about the memory barriers in patch 3..

Patch 1 for Will/smmu, 5-6 for drm/msm, rest for qcom

[1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/27665

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (8):
      dt-bindings: arm-smmu: Add QCM2290 GPU SMMU
      dt-bindings: clock: Add Qcom QCM2290 GPUCC
      clk: qcom: clk-alpha-pll: Add HUAYRA_2290 support
      clk: qcom: Add QCM2290 GPU clock controller driver
      drm/msm/adreno: Add missing defines for A702
      drm/msm/adreno: Add A702 support
      arm64: dts: qcom: qcm2290: Add GPU nodes
      arm64: dts: qcom: qrb2210-rb1: Enable the GPU

 .../bindings/clock/qcom,qcm2290-gpucc.yaml         |  76 ++++
 .../devicetree/bindings/iommu/arm,smmu.yaml        |   3 +-
 arch/arm64/boot/dts/qcom/qcm2290.dtsi              | 154 ++++++++
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts           |   8 +
 drivers/clk/qcom/Kconfig                           |   9 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/clk-alpha-pll.c                   |  45 +++
 drivers/clk/qcom/clk-alpha-pll.h                   |   3 +
 drivers/clk/qcom/gpucc-qcm2290.c                   | 423 +++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx.xml.h              |  18 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  92 ++++-
 drivers/gpu/drm/msm/adreno/adreno_device.c         |  18 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |  16 +-
 include/dt-bindings/clock/qcom,qcm2290-gpucc.h     |  32 ++
 14 files changed, 888 insertions(+), 10 deletions(-)
---
base-commit: 26d7d52b6253574d5b6fec16a93e1110d1489cef
change-id: 20240219-topic-rb1_gpu-3ec8c6830384

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>



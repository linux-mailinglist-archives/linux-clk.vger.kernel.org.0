Return-Path: <linux-clk+bounces-15143-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 95DEA9DE6F0
	for <lists+linux-clk@lfdr.de>; Fri, 29 Nov 2024 14:07:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD799164862
	for <lists+linux-clk@lfdr.de>; Fri, 29 Nov 2024 13:07:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 591A119DF5F;
	Fri, 29 Nov 2024 13:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="unDdMGHo"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF71D156991
	for <linux-clk@vger.kernel.org>; Fri, 29 Nov 2024 13:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732885646; cv=none; b=PskvQDc+icMv+Vb2gytLBCVetudRGpAAz3gQOWnB8+JqyclIlWvg9SoDWwDoILgyi9BWvL5dRgbG6lkO6qqwU4rnGbwzTEFKZplTzobQUGf91lctlRAaS2FGbyJyTxS+6jmY0ReXdh03iyQj6Y1Yfsun9/NjipgOOOe3LMj8otI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732885646; c=relaxed/simple;
	bh=qxbzNss1BI/oiug9lBmh5y4cuBoGq10mu7r5XGWu9qs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Isg/EqSSju/yRzqRiE85zYvy0JkDck2Q/Y7z5aMUyEstisMullUS4zg2Q5gVzLtTgc1OQUbNHWV4jzITspdXm9EpCuBYUeRWk5nxbivclijFs7TSbki+R2ou/UuON3Wnvq7nKhglOlUA3P4ibb/dlNhPjfFu2PAxuKcN3MWyJLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=unDdMGHo; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4349f160d62so16819345e9.2
        for <linux-clk@vger.kernel.org>; Fri, 29 Nov 2024 05:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732885641; x=1733490441; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9ZZr43P8CMAkfD6cdkN7FEv1AxVJuI6eZC+wA5Ire5U=;
        b=unDdMGHoLMDBGr+kuolzEhce3AXoHVm01j6s9fz3DfDxK9LT7b35fHu/mjg2G0Nzx6
         C2U+Y2SX0ZKikaW2ffeSALpW3wRxhcxcf5AFlzMy7/4Sr+K5Ekxyv93JAhPHgBUTUHOs
         O8TZSPFuM8sAyW0V9QMEPFoA4eXAEv0jFHEoVHUezq7nEtuyPUNonFqGwM7Jzw2UaVe0
         N6rk252rkF76hTd0kGeIbH8XKql+BXVhqWLIv8kB/FedW47ZLcLzn/5mJjJelYUOXbsn
         xPNOFkYlogfKULE2URugXsokPj0/1GWdA5H/9iUoyMllE2wweyWCuQHCssg2tN3W+BVJ
         5kpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732885641; x=1733490441;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ZZr43P8CMAkfD6cdkN7FEv1AxVJuI6eZC+wA5Ire5U=;
        b=IOCPdJr+vLaNnHPKja1RSMyNeBE0ukZggyK/eoU0AbgAAIbrzIqzxySwJZ0z2wrVGr
         aSjO3YunMf1IzhsrPFHPXEiXRb/NQW8sMynd06GYZm9OpI4n06Z/N+wUhrkd842rctFO
         NxYry9ASxtIX8LEp3X4PeRPBasEvVXMzAQUj1PLWtY3pdP4VBZJRgjlUjWi8UCcdLimX
         IhNx/sg/qxkYXzmwxYuKKQfvh4YAwB1/NGT8kLn2/disHnEbUziF9FkCFiIQLCfHuswB
         POlkHcS6nsL5fveGjftBS5Nw+KrqgzDDwc22sS+03lazPs6NFpAE2ZdcpOON7vy++ys0
         mP+g==
X-Forwarded-Encrypted: i=1; AJvYcCXCJrSFcJnRqcJ3AVi5rei0t/CKuBhrPc3bOUe3n6NV/dbablNd1+FqKbVk8oPxAyV/baSVqpl4C6o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDWAKlNnMtHuhgmJL0tSg/Ry1byZ4dZ+mSpOaS9ly5S94/dUAy
	4q/JwIkcLJ1jpg1OCneHVOPgB7TrKN8GXZw5Tg3g993yHmOZX+Tr9B9a10tLJyw=
X-Gm-Gg: ASbGncvOrhoJO+iNN0bqEmyfRAw64UMr7hdrLKrPvpIIfJSpjtKIeh2Gm4zFIlD7qC0
	0XpPGEtv3TC/A708gg/rSQLcGrPOf4UHhyyDEkOLPuv+i7dzQqVClsh528tZcXkXns9Ds9gvMFV
	uYMnjLweFOXzkd0dWT5lr1g2QUpmdrkmCTpbUu+AR5+WaK4y5JxoCumsZM3aRvgyS45DH1UMPqE
	/BGL/AmYkyYfIFVxdf32hPxc9AFPx/mWt2vdgFBEdIizfrlK2K5haNf/NY=
X-Google-Smtp-Source: AGHT+IGxL6oQz9FnIs17wyrC0PXlW6fDNacEIvFfQUHleLYHBBsfyQleQvhStnWGaKIHQgezv7Cuqg==
X-Received: by 2002:a05:600c:1e09:b0:434:a8d8:760e with SMTP id 5b1f17b1804b1-434a9dc6774mr97008665e9.19.1732885633267;
        Fri, 29 Nov 2024 05:07:13 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa77d01esm86228395e9.22.2024.11.29.05.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 05:06:52 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v6 0/3] clk: qcom: Add support for multiple power-domains
 for a clock controller.
Date: Fri, 29 Nov 2024 13:06:46 +0000
Message-Id: <20241129-b4-linux-next-24-11-18-clock-multiple-power-domains-v6-0-24486a608b86@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGa8SWcC/6XRwW6DMAwG4Fepcp4n4jgh3WnvMe1gkrSNRgkKl
 DFVvPvSnpi4seP/H/zZ8l0MIccwiLfDXeQwxSGmrgTzchDuwt05QPQlC6yQpJQWGoI2drcZujC
 PgARSQqldm9wXXG/tGPs2QJ++Qwafrhy7AVifjkfyjjSyKJP7HE5xfqofnyVf4jCm/PNcYpKP9
 n/eJKGCpmZsvMWGVf1eRnBOrymfxQOccIWg3odgQViHWmvydSC9QdQaMfsQVRCrjGevlEbJG4T
 WSL0PoYKQIuupco1R20v0Gtn5E10Qx2jRODJW0h9kWZZffSEev4sCAAA=
X-Change-ID: 20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-a5f994dc452a
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15-dev-355e8

Changes in v6:
- Passes NULL to second parameter of devm_pm_domain_attach_list - Vlad
- Link to v5: https://lore.kernel.org/r/20241128-b4-linux-next-24-11-18-clock-multiple-power-domains-v5-0-ca2826c46814@linaro.org

Changes in v5:
- In-lines devm_pm_domain_attach_list() in probe() directly - Vlad
- Link to v4: https://lore.kernel.org/r/20241127-b4-linux-next-24-11-18-clock-multiple-power-domains-v4-0-4348d40cb635@linaro.org

v4:
- Adds Bjorn's RB to first patch - Bjorn
- Drops the 'd' in "and int" - Bjorn
- Amends commit log of patch 3 to capture a number of open questions -
  Bjorn
- Link to v3: https://lore.kernel.org/r/20241126-b4-linux-next-24-11-18-clock-multiple-power-domains-v3-0-836dad33521a@linaro.org

v3:
- Fixes commit log "per which" - Bryan 
- Link to v2: https://lore.kernel.org/r/20241125-b4-linux-next-24-11-18-clock-multiple-power-domains-v2-0-a5e7554d7e45@linaro.org

v2:
The main change in this version is Bjorn's pointing out that pm_runtime_*
inside of the gdsc_enable/gdsc_disable path would be recursive and cause a
lockdep splat. Dmitry alluded to this too.

Bjorn pointed to stuff being done lower in the gdsc_register() routine that
might be a starting point.

I iterated around that idea and came up with patch #3. When a gdsc has no
parent and the pd_list is non-NULL then attach that orphan GDSC to the
clock controller power-domain list.

Existing subdomain code in gdsc_register() will connect the parent GDSCs in
the clock-controller to the clock-controller subdomain, the new code here
does that same job for a list of power-domains the clock controller depends
on.

To Dmitry's point about MMCX and MCX dependencies for the registers inside
of the clock controller, I have switched off all references in a test dtsi
and confirmed that accessing the clock-controller regs themselves isn't
required.

On the second point I also verified my test branch with lockdep on which
was a concern with the pm_domain version of this solution but I wanted to
cover it anyway with the new approach for completeness sake.

Here's the item-by-item list of changes:

- Adds a patch to capture pm_genpd_add_subdomain() result code - Bryan
- Changes changelog of second patch to remove singleton and generally
  to make the commit log easier to understand - Bjorn
- Uses demv_pm_domain_attach_list - Vlad
- Changes error check to if (ret < 0 && ret != -EEXIST) - Vlad
- Retains passing &pd_data instead of NULL - because NULL doesn't do
  the same thing - Bryan/Vlad
- Retains standalone function qcom_cc_pds_attach() because the pd_data
  enumeration looks neater in a standalone function - Bryan/Vlad
- Drops pm_runtime in favour of gdsc_add_subdomain_list() for each
  power-domain in the pd_list.
  The pd_list will be whatever is pointed to by power-domains = <>
  in the dtsi - Bjorn
- Link to v1: https://lore.kernel.org/r/20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-v1-0-b7a2bd82ba37@linaro.org

v1:
On x1e80100 and it's SKUs the Camera Clock Controller - CAMCC has
multiple power-domains which power it. Usually with a single power-domain
the core platform code will automatically switch on the singleton
power-domain for you. If you have multiple power-domains for a device, in
this case the clock controller, you need to switch those power-domains
on/off yourself.

The clock controllers can also contain Global Distributed
Switch Controllers - GDSCs which themselves can be referenced from dtsi
nodes ultimately triggering a gdsc_en() in drivers/clk/qcom/gdsc.c.

As an example:

cci0: cci@ac4a000 {
	power-domains = <&camcc TITAN_TOP_GDSC>;
};

This series adds the support to attach a power-domain list to the
clock-controllers and the GDSCs those controllers provide so that in the
case of the above example gdsc_toggle_logic() will trigger the power-domain
list with pm_runtime_resume_and_get() and pm_runtime_put_sync()
respectively.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
Bryan O'Donoghue (3):
      clk: qcom: gdsc: Capture pm_genpd_add_subdomain result code
      clk: qcom: common: Add support for power-domain attachment
      clk: qcom: Support attaching GDSCs to multiple parents

 drivers/clk/qcom/common.c |  6 ++++++
 drivers/clk/qcom/gdsc.c   | 41 +++++++++++++++++++++++++++++++++++++++--
 drivers/clk/qcom/gdsc.h   |  1 +
 3 files changed, 46 insertions(+), 2 deletions(-)
---
base-commit: 744cf71b8bdfcdd77aaf58395e068b7457634b2c
change-id: 20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-a5f994dc452a

Best regards,
-- 
Bryan O'Donoghue <bryan.odonoghue@linaro.org>



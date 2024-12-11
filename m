Return-Path: <linux-clk+bounces-15758-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2856B9ED2CF
	for <lists+linux-clk@lfdr.de>; Wed, 11 Dec 2024 17:54:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 634631889CFC
	for <lists+linux-clk@lfdr.de>; Wed, 11 Dec 2024 16:54:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDF9A1DE3CB;
	Wed, 11 Dec 2024 16:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aQCLuGHV"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4650F1DDC36
	for <linux-clk@vger.kernel.org>; Wed, 11 Dec 2024 16:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733936078; cv=none; b=Isf6AKC1NBdScTQgRYe6IiF1ko7W8QRlX5vUorhkJrPetuZBopMOvf42pWJz7tgs0GM8vpcVjENxdOpTwMQpS8NMpQ3et6t4BSYVoUbQoSKpQjZMTYwnZLlcl9am8LPnMKloExdJmUlZdPTVg2oEpJCsOJtgBJu/l626lJHbo4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733936078; c=relaxed/simple;
	bh=VnyOhYWDYH2MiYPEnuBWdlFdm9LJxRqSYLWcu+p5MTg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=umxH3lfPPo5ZRDSloIxNHaigjbdIjWF9wahJ1lqj2mm60fcZK3L7ofzmHkwlXImqEqpjPOfIhIq5NkTUCgQND/emov19q7MOGSTPo7qyCGPbDieojFpsucMzXySok387SER+kuYOfZfg0owRPKxfyXtYVYiRVH4Mq1fYIay8IuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aQCLuGHV; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-aa6997f33e4so462771766b.3
        for <linux-clk@vger.kernel.org>; Wed, 11 Dec 2024 08:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733936074; x=1734540874; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i1AlkCdAOmZU3g5XryLDJ6QGXZ5vCoo5BMWnmYQJ2do=;
        b=aQCLuGHVzv8ZNh6rqDKyKLz+HnH5R5iLZbjYTNoR4SpytA5U93FFQfeLM8GUIwS+Ca
         FkArcV0XnE8cFQdrIvph90YO+VQqKkdqqrLGj8SrVENS8RprvLs+USMbBePJUwOCsADN
         jgzR+WV1CYoxE0rLTaubxQ+pG+A3/wnK/PKjjB1R1pv6408FRKBhhvuV7HJDqQOYIyxp
         yqb2g5muXfgCgIHzrGT3hAyQwWqbzlhxKGZIGujSZ0GGCwnISbH8+mMFg5mkhVb47pPc
         U71prkIJjs8GXJ3OVReL+2zqyB/fnsFY1sP3EPiJe41EAX+WrFn3Eu8pJLzwI3vjRGyL
         vx5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733936074; x=1734540874;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i1AlkCdAOmZU3g5XryLDJ6QGXZ5vCoo5BMWnmYQJ2do=;
        b=CQYFJXqpMnu0X/bTV6gvaa294sCaYjGrNPtGW0HbLoyGfv2+zuoWI6NkwxdP9zUUC/
         oQ6BVJE9wTU4a0GFmOv4v6K/v1zoCwp3rSqXqLnUUi+ZpdrgX3n8Q5yNmC88meCSLqFN
         0EiGnBssV2e5CbYTZwJWJkNs3RopGtMt3IHAbf4CfDcABVClTTuWZgz8it8K4mB28YOU
         7+sgF/fbYx6CyRYvZUXTkzXuEREyTM8SNTffkx97XYRbfxtZ6iCSPHgxqqFW3p3bOyi9
         +4/FLFB7Ub5hol6M0G2rct0C82RN3EV2fXVGGwi/72bBgDpM2b7IYQBEKMUhQ66Lj43m
         WZHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXC09CdrSbTva8NQY72l7ihUWR99kdwoiuruqECHUk6mS8KcFm3p3Vsx2XlEwo7Tlh+b3gPcFoTLAA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIN25O25K4vcfNpk6B8XjOvbwQRriI+zdzq0sBsE47r/l1liZc
	IjALmsJ9c8MavAJeefRgWbP9cu0Ib6rsDp8Rtb4ed5cH5hDxP2sXEMAykIGb6kU=
X-Gm-Gg: ASbGnctDxYFrPTcKQASp2b4L8lhFXoAiL9DQjmMig1xBaxOICQTVDkhbmIk+/L9ymp4
	f8syd9a0bzHxG95SDJH9FSLdxW1jpFE9ssJCEn/94f19WXB9lV/ulWh50kl1sF6eRDG5odmNpP9
	HoPvAZPsjy3Jbs9ai2reJdTBq+DZFM/Locvh1+oCA3Q3C+uMOruI8TsgtfqoTikMGBkpYNnyUY+
	Q8zBjzy9msnTVLtPtX3uQpKbDgBAyfmlopDc8S357exHsJKAh3H+7SJUp1zzA8=
X-Google-Smtp-Source: AGHT+IEOAHImHIPs02bjfj77uQEW+LtQR5yCdFKmKfBDZAp8rrB0A0VqFNmmF75uqor9HkpELN2pRw==
X-Received: by 2002:a17:907:7702:b0:aa6:acd6:b30d with SMTP id a640c23a62f3a-aa6b1396eabmr317931266b.48.1733936074471;
        Wed, 11 Dec 2024 08:54:34 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa66c646defsm651623866b.181.2024.12.11.08.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 08:54:34 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v8 0/3] clk: qcom: Add support for multiple power-domains
 for a clock controller.
Date: Wed, 11 Dec 2024 16:54:31 +0000
Message-Id: <20241211-b4-linux-next-24-11-18-clock-multiple-power-domains-v8-0-5d93cef910a4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMfDWWcC/6XRPW7DMAwF4KsEmsvCoqgfZ+o9ig6ypCRCHSuQE
 zdFkLuXyVIX3tzxcXgfCd7EmGpOo9hubqKmKY+5DBzcy0aEgx/2CXLkLLBBklI66Aj6PFyuMKT
 rGZBASuBx6Ev4hOOlP+dTn+BUvlKFWI4+DyN4vWtbioE0esHNp5p2+fpU3z84H/J4LvX7ucQkH
 9P/eZOEBjrrsYsOO6/sG1f4Wl5L3YsHOOEMQb0OQUa8TlZrijaRXiBqjph1iGLEKRN9VEqj9Au
 E5ohdhxAjpMhFakJn1PISPUdW/kQzEjw6NIGMk7RAzBxp1yGGESRyxpvGdc4sEPuLIBeuQiwjN
 qkGd7Fpybk/yP1+/wE9LoF+VQMAAA==
X-Change-ID: 20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-a5f994dc452a
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15-dev-355e8

Changes in v8:
- Picks up change I agreed with Vlad but failed to cherry-pick into my b4
  tree - Vlad/Bod
- Rewords the commit log for patch #3. As I read it I decided I might
  translate bits of it from thought-stream into English - Bod
- Link to v7: https://lore.kernel.org/r/20241211-b4-linux-next-24-11-18-clock-multiple-power-domains-v7-0-7e302fd09488@linaro.org

Changes in v7:
- Expand commit log in patch #3
  I've discussed with Bjorn on IRC and video what to put into the log here
  and captured most of what we discussed.

  Mostly the point here is voting for voltages in the power-domain list
  is up to the drivers to do with performance states/opp-tables not for the
  GDSC code. - Bjorn/Bryan
- Link to v6: https://lore.kernel.org/r/20241129-b4-linux-next-24-11-18-clock-multiple-power-domains-v6-0-24486a608b86@linaro.org

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



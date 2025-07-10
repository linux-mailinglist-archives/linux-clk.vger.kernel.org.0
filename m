Return-Path: <linux-clk+bounces-24598-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4C7B00E10
	for <lists+linux-clk@lfdr.de>; Thu, 10 Jul 2025 23:46:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0AC855C4054
	for <lists+linux-clk@lfdr.de>; Thu, 10 Jul 2025 21:46:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC9A428C2C7;
	Thu, 10 Jul 2025 21:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GRiThXAS"
X-Original-To: linux-clk@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9264A0C
	for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 21:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752183945; cv=none; b=ZXIbJkdtnVEUlosdoMdxVpZc1KkIH51g+hsCnszeorFjB38RU453BKQfoFk2nVmKxHS7ZSgQmT6/nY/UGF1yc1pUHBSew1NnQ0SedlBPQvnAtl//lOW7Lam01JkH+X7ukQFYIvpklDa/qr5Tuy+nRRunGVesT0NMEgeSrW21Yyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752183945; c=relaxed/simple;
	bh=zfaKbsjTIJUhXHmziLeatyZLED8TfK/HMSac+637Klw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=utsL40jJQA98KT0k8CsjFMNH9MQ+eOt6+PBqnq1Bv4FQ+HpJeSLr95EAOyAwqXfkrMlQboCsH5O21aw/F7/9lvE6JYTX+qJuNuOZJTBcNYsFNqSX6/aA1K+mKM1EcjB8ob/oyPABIDGbwHrsrFYhnlSinOi/pVAbbNbMQ4DwqSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GRiThXAS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752183943;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2nR8oPeDizANp1JR9NBRrDAUbozrEEG5H7dIC150e9E=;
	b=GRiThXASkqhOiwIYXXYHu822Cj6rvC6Ggax61IQtyZcbvSsiPcHrj1MPH1DiIEXAhEv/b9
	KJJiY2wW7lBrKRU8cjpxqKN8JglYYirYRBHkE0eLvs2QTisHqooPIS5wqwVVr3mVCFDFrC
	PCtrdUJn2ylb3r637DkbzgOIZPv94RI=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-101-vBaBQFerPy-kpuph_CjsQA-1; Thu, 10 Jul 2025 17:45:41 -0400
X-MC-Unique: vBaBQFerPy-kpuph_CjsQA-1
X-Mimecast-MFC-AGG-ID: vBaBQFerPy-kpuph_CjsQA_1752183941
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4139102c793so1367617b6e.1
        for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 14:45:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752183940; x=1752788740;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2nR8oPeDizANp1JR9NBRrDAUbozrEEG5H7dIC150e9E=;
        b=FCAcYHio32JXRdxEKJWW32A0qCyziGlf6bL/frxbDSOH2YwL9aX66RDdmMMgA2Truk
         CtagHaylTtm6KoFB+dGAVP5nocGGA5UbLT73mNi3rVkWlX533w11GuDCkmIDgpwGWXWd
         9USkQHzlEl1MMhRtJ0W1X4nlxS4su0qsG0x4IU/CFon3jAG/0tjG6POW21ruLDnflbFJ
         ajC6HBqwYAmoX2ZLTgXzwv5Ogq+xN50AWiEhpGjBtVI8O1Q9FoLZ8ToAvYcYkd2eH3+w
         bRyaD5/UQn1SVDU5nEcAaJ5SegNq2/48WN+Ah6+4I+2gtDDO68GsxizxTkwMXnUIML4x
         kz7g==
X-Gm-Message-State: AOJu0Yy7HcgTRQizUdjBC3MOyJg7i4klo5duJZ82M+W86F4546cv3rWr
	waF5ZVdbfB7LACAsjaSPhBZ8uWG3OrRo0Q1vu9vRPqMBkmc24bw+BSMGrfQqS5WVh2NrUEwgjH9
	SRqRSCbnqh9U7niaulogGBpkfChsLd21ygp+L02XtqYncpazncLuA/IVMwRtp9L8aRRY71yUj
X-Gm-Gg: ASbGncuG2KImLoPRvsCjZL9i2L9Fn++5ZIfeDwAdPK4ZUzYBdQWdOil0Ig+nfwFDMBP
	fUW2kyElBdGK6tDlcN/DSnLUbvQVawvVsNp8V+i4PxSOcDAPFf/7x8TEMyLUklYPe/7TZcDuG9f
	eIF9oLEMsbNaXZ4yHy5ioXJoyzYlvycaKQnTIHAj/h3fARQJZDMf+ehwKUb91OMv4GWXFX79MpO
	67ZnJIUF5DN0AzhyhydnKN//bnxJRdwJoJyGrGm/0fQWU/Eyf8C4eVqrfqn5o1CCpOrpcOMAZcW
	3VuCcspKGfNOCULYi2FMUfNOgW6GdMo+9OrITlWBO0n6
X-Received: by 2002:a05:6808:5242:b0:40a:561a:9e8c with SMTP id 5614622812f47-41537567287mr381005b6e.3.1752183940558;
        Thu, 10 Jul 2025 14:45:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGS2ydIqC7N3ypSjKNKB/xVuCJZSu15TeV2crSJSiS9mMLiIvIupf3/H79OOLOFsQdfgJIMDQ==
X-Received: by 2002:a05:6808:5242:b0:40a:561a:9e8c with SMTP id 5614622812f47-41537567287mr380988b6e.3.1752183940159;
        Thu, 10 Jul 2025 14:45:40 -0700 (PDT)
Received: from [10.144.155.224] ([2600:382:8102:a87a:c1c4:9ad5:f0c:c0f7])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-41419baa00dsm345483b6e.22.2025.07.10.14.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 14:45:39 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH 0/6] clk: tegra: convert from clk round_rate() to
 determine_rate()
Date: Thu, 10 Jul 2025 17:45:12 -0400
Message-Id: <20250710-clk-tegra-round-rate-v1-0-e48ac3df4279@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGg0cGgC/x3MSwqAMAwA0atI1gbagt+riIsSowalSqoiiHe3u
 HyLmQciq3CENntA+ZIoW0iweQY0+zAxypAMzrjCVNYgrQsePKlH3c4woPqDseCGyNZl3TiClO7
 Ko9z/tuvf9wMQ0irmZgAAAA==
X-Change-ID: 20250710-clk-tegra-round-rate-5e9cc186892c
To: Peter De Schrijver <pdeschrijver@nvidia.com>, 
 Prashant Gaikwad <pgaikwad@nvidia.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752183937; l=5139;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=zfaKbsjTIJUhXHmziLeatyZLED8TfK/HMSac+637Klw=;
 b=hHP8hjDdq+Hf7u4Bde6o43O1tYdLVAMLKLlWelILbNA6pcpdIRkJ+ww0xIC5nKyF1uyIWDVSq
 r1EMB7T+SKyBKiQ5dbzV5lY7ABM2CptyK85fXHvSWhNHpObGqLR2xUO
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated in the clk framework in favor
of the determine_rate() clk ops, so let's go ahead and convert the
drivers in the clk/tegra subsystem using the Coccinelle semantic patch
posted below. I did a few minor cosmetic cleanups of the code in a
few cases.

Coccinelle semantic patch:

    virtual patch

    // Look up the current name of the round_rate function
    @ has_round_rate @
    identifier round_rate_name =~ ".*_round_rate";
    identifier hw_param, rate_param, parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    	...
    }

    // Rename the route_rate function name to determine_rate()
    @ script:python generate_name depends on has_round_rate @
    round_rate_name << has_round_rate.round_rate_name;
    new_name;
    @@

    coccinelle.new_name = round_rate_name.replace("_round_rate", "_determine_rate")

    // Change rate to req->rate; also change occurrences of 'return XXX'.
    @ chg_rate depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    identifier ERR =~ "E.*";
    expression E;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    (
    -return -ERR;
    +return -ERR;
    |
    - return rate_param;
    + return 0;
    |
    - return E;
    + req->rate = E;
    +
    + return 0;
    |
    - rate_param
    + req->rate
    )
    ...>
    }

    // Coccinelle only transforms the first occurrence of the rate parameter
    // Run a second time. FIXME: Is there a better way to do this?
    @ chg_rate2 depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    - rate_param
    + req->rate
    ...>
    }

    // Change parent_rate to req->best_parent_rate
    @ chg_parent_rate depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    (
    - *parent_rate_param
    + req->best_parent_rate
    |
    - parent_rate_param
    + &req->best_parent_rate
    )
    ...>
    }

    // Convert the function definition from round_rate() to determine_rate()
    @ func_definition depends on chg_rate @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    identifier generate_name.new_name;
    @@

    - long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
    -               unsigned long *parent_rate_param)
    + int new_name(struct clk_hw *hw, struct clk_rate_request *req)
    {
        ...
    }

    // Update the ops from round_rate() to determine_rate()
    @ ops depends on func_definition @
    identifier has_round_rate.round_rate_name;
    identifier generate_name.new_name;
    @@

    {
        ...,
    -   .round_rate = round_rate_name,
    +   .determine_rate = new_name,
        ...,
    }

Note that I used coccinelle 1.2 instead of 1.3 since the newer version
adds unnecessary braces as described in this post.
https://lore.kernel.org/cocci/67642477-5f3e-4b2a-914d-579a54f48cbd@intel.com/

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (6):
      clk: tegra: audio-sync: convert from round_rate() to determine_rate()
      clk: tegra: divider: convert from round_rate() to determine_rate()
      clk: tegra: periph: divider: convert from round_rate() to determine_rate()
      clk: tegra: pll: convert from round_rate() to determine_rate()
      clk: tegra: super: convert from round_rate() to determine_rate()
      clk: tegra: tegra210-emc: convert from round_rate() to determine_rate()

 drivers/clk/tegra/clk-audio-sync.c   | 10 +++----
 drivers/clk/tegra/clk-divider.c      | 28 ++++++++++++-------
 drivers/clk/tegra/clk-periph.c       |  8 +-----
 drivers/clk/tegra/clk-pll.c          | 52 +++++++++++++++++++++---------------
 drivers/clk/tegra/clk-super.c        |  9 +------
 drivers/clk/tegra/clk-tegra210-emc.c | 24 +++++++++++------
 6 files changed, 72 insertions(+), 59 deletions(-)
---
base-commit: b551c4e2a98a177a06148cf16505643cd2108386
change-id: 20250710-clk-tegra-round-rate-5e9cc186892c

Best regards,
-- 
Brian Masney <bmasney@redhat.com>



Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01C9E2C681C
	for <lists+linux-clk@lfdr.de>; Fri, 27 Nov 2020 15:46:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730957AbgK0Opv (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 27 Nov 2020 09:45:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729913AbgK0Opu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 27 Nov 2020 09:45:50 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C814C0613D1;
        Fri, 27 Nov 2020 06:45:50 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id k14so5860656wrn.1;
        Fri, 27 Nov 2020 06:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eD5tyVoTAsH68bnD9XqzP45KTYtONvr8pYzSU1Ul9rs=;
        b=nMHA1L+07mGv+MoJykXr0hd+aH3HOW1MGET4akb9R/oSNitI5ojZlzd5glc7pDMcxJ
         1YyEFa3Omsci/1E2nZUwv+Mdo7zB3pNGeE4H0lKXZmyR5/EUCEAIhlM9AA6gRxvb7e15
         l5oVmjHwc4a6m5yFAGo/6cJSLyqG7rXOP8C7kLpx6EGc0N7zIz+T8U/SXzW80HLIFrx0
         NL64AabRiBhUkj4DLd46oo6c36cLuXVt5yjYJ8+ZNQKxiYgUNExcHOSd+Q2VAz7CkJ+4
         eNAdz4JTnkBYjb/IgS06vM2cxqu++SVXDCYkS/vUujpsbeuLI9tYY5nKGOs96vgG7QZ6
         s8+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eD5tyVoTAsH68bnD9XqzP45KTYtONvr8pYzSU1Ul9rs=;
        b=koq9kPqhebj0PviLTIfRoGEx+MwTVE7Tgk7oQRJbmKW2lNL+qek1tvIa8HzqoozD0/
         TV+6Vjn2v6gPOvwtaPrpx6OLs95amgjyP6HzuJ29UjNJZfErG0Zdmc/5jXmaqUKfUQSF
         TIb7MkenHmD+ooFzii997T1dAb4yW1VTzEzsLXHZKadJ6n2ILuhRYc6E3xKtqMiOXs6J
         pz7+mIlJsxWttCBy0rjIT+qe7rkiHPQqpTq0btrBRbAMK9uaMuTgUSU7+h3LzGFPCMzf
         kvM1/r+sdF+cDpFpHOImGHI06+B2h0L7cV8wsDsXhz3uO64RiiCJU4s82mMbXKdVbkr0
         Vwbg==
X-Gm-Message-State: AOAM532cW5oJ17wfIQVin32LSlOOK1iuXSH/nrmt/OipFCGvMzGS1DnB
        RDinQXU5nsDAYgP7EOREBjQ=
X-Google-Smtp-Source: ABdhPJwXWq6wpQCFtmwkrGwPJD6N7a8201FeIg5KdL1EPAjhzHMv7QA17z422m2U5bS6UeYd30vGjQ==
X-Received: by 2002:a5d:4141:: with SMTP id c1mr5084872wrq.80.1606488347985;
        Fri, 27 Nov 2020 06:45:47 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id f18sm14847542wru.42.2020.11.27.06.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 06:45:46 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [GIT PULL] clk: tegra: Changes for v5.11-rc1
Date:   Fri, 27 Nov 2020 15:45:45 +0100
Message-Id: <20201127144545.125335-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.29.2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Mike, Stephen,

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/for-5.11-clk

for you to fetch changes up to a886c310d9fcb0e66253d4af225cba13f9bdf5d2:

  clk: tegra: bpmp: Clamp clock rates on requests (2020-11-26 16:28:07 +0100)

Turns out there were fewer patches than I thought. Some of the patches
I was planning to pick up will be going in through the memory controller
tree as dependencies, so here's the rest that are independent.

Thanks,
Thierry

----------------------------------------------------------------
clk: tegra: Changes for v5.11-rc1

This set consists of two fixes for minor issues that rarely, if ever,
happen, so not urgent enough for these to go into v5.10.

----------------------------------------------------------------
Nicolin Chen (1):
      clk: tegra: Do not return 0 on failure

Sivaram Nair (1):
      clk: tegra: bpmp: Clamp clock rates on requests

 drivers/clk/tegra/clk-bpmp.c | 6 +++---
 drivers/clk/tegra/clk-dfll.c | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

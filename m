Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35788202079
	for <lists+linux-clk@lfdr.de>; Sat, 20 Jun 2020 05:31:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733172AbgFTDbM (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 19 Jun 2020 23:31:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733053AbgFTDa7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 19 Jun 2020 23:30:59 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3710FC0619EC
        for <linux-clk@vger.kernel.org>; Fri, 19 Jun 2020 20:30:25 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id i12so4989447pju.3
        for <linux-clk@vger.kernel.org>; Fri, 19 Jun 2020 20:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TsJU39le/9mzUUvkg/vEQ1ejtljvEC7MElEcoRxU/hs=;
        b=nLZb9q5MNXSO30mRLC8p+Z6tp7SeKI4c8mbyilFhnvlC39t+V3j0iQJ4vfU5EbJ/Ge
         yJs0yUXWykR2+lKlShzU2CG/atXeM++8u60h/nbziIo1McpvPT8URV5HcgXBrobq0ydJ
         LtCik9CXYKbYzZN1wG1+1XbNp5/sueNlWfLSk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TsJU39le/9mzUUvkg/vEQ1ejtljvEC7MElEcoRxU/hs=;
        b=DFj7d0cpoPDPvDZNeK1xZRssOhUt7XzSPkVw85STqPPQdxtgq8+A/Dnk9wuHjF31HN
         bzWoetmUcfQ9nx+01wAs4lKMRENaw4tbsLQ0rco3NQRl2Ug9KB9dO1D0C5H9SVqOOe/e
         L4ozhwjpYu16UIre1s9Z5b/F6TuD9D+rhoIDtJXa8RGWMMvlwB5j84m7q/51Vs0GQMQt
         d1NUIfqK5Cs8GG+cdE8Dvh+gboloGk+aaNvHb5DFJTG2Sm/IIOwUc+H/aP7lMISFJ/fl
         scj2fUI6gEZ9kGuiUOA/ct0h6CfgoFYOH30PDK3HoqIeVzNi0JTA3RaRmBE0ukosih8/
         kU+Q==
X-Gm-Message-State: AOAM533XB7bqF46gM2HICbFIyA0AlPypJhb3H9rZCYDUXLnM1ZVqV27c
        7Gbsbg383d/Yyb9Q7SmlQqe9EA==
X-Google-Smtp-Source: ABdhPJx/5DcfB27JAL/c3SFwGw95qhIKfr9dnkeTlJXy/0XzMHLMuVPklbRvet5f9iLDNbeJ3PiIXQ==
X-Received: by 2002:a17:902:8f83:: with SMTP id z3mr10333002plo.203.1592623824777;
        Fri, 19 Jun 2020 20:30:24 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id ev20sm6238855pjb.8.2020.06.19.20.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2020 20:30:20 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     Kees Cook <keescook@chromium.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Alexander Potapenko <glider@google.com>,
        Joe Perches <joe@perches.com>,
        Andy Whitcroft <apw@canonical.com>, x86@kernel.org,
        drbd-dev@lists.linbit.com, linux-block@vger.kernel.org,
        b43-dev@lists.infradead.org, netdev@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-wireless@vger.kernel.org,
        linux-ide@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-mm@kvack.org,
        clang-built-linux@googlegroups.com
Subject: [PATCH v2 10/16] KVM: PPC: Book3S PR: Remove uninitialized_var() usage
Date:   Fri, 19 Jun 2020 20:30:01 -0700
Message-Id: <20200620033007.1444705-11-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200620033007.1444705-1-keescook@chromium.org>
References: <20200620033007.1444705-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Using uninitialized_var() is dangerous as it papers over real bugs[1]
(or can in the future), and suppresses unrelated compiler warnings (e.g.
"unused variable"). If the compiler thinks it is uninitialized, either
simply initialize the variable or make compiler changes. As a precursor
to removing[2] this[3] macro[4], just remove this variable since it was
actually unused:

arch/powerpc/kvm/book3s_pr.c:1832:16: warning: unused variable 'vrsave' [-Wunused-variable]
        unsigned long vrsave;
                      ^

[1] https://lore.kernel.org/lkml/20200603174714.192027-1-glider@google.com/
[2] https://lore.kernel.org/lkml/CA+55aFw+Vbj0i=1TGqCR5vQkCzWJ0QxK6CernOU6eedsudAixw@mail.gmail.com/
[3] https://lore.kernel.org/lkml/CA+55aFwgbgqhbp1fkxvRKEpzyR5J8n1vKT1VZdz9knmPuXhOeg@mail.gmail.com/
[4] https://lore.kernel.org/lkml/CA+55aFz2500WfbKXAx8s67wrm9=yVJu65TpLgN_ybYNv0VEOKA@mail.gmail.com/

Suggested-by: Nathan Chancellor <natechancellor@gmail.com>
Fixes: f05ed4d56e9c ("KVM: PPC: Split out code from book3s.c into book3s_pr.c")
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/powerpc/kvm/book3s_pr.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_pr.c b/arch/powerpc/kvm/book3s_pr.c
index ef54f917bdaf..ed12dfbf9bb5 100644
--- a/arch/powerpc/kvm/book3s_pr.c
+++ b/arch/powerpc/kvm/book3s_pr.c
@@ -1828,9 +1828,6 @@ static int kvmppc_vcpu_run_pr(struct kvm_vcpu *vcpu)
 {
 	struct kvm_run *run = vcpu->run;
 	int ret;
-#ifdef CONFIG_ALTIVEC
-	unsigned long uninitialized_var(vrsave);
-#endif
 
 	/* Check if we can run the vcpu at all */
 	if (!vcpu->arch.sane) {
-- 
2.25.1


Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B67D32020EE
	for <lists+linux-clk@lfdr.de>; Sat, 20 Jun 2020 05:34:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732860AbgFTDds (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 19 Jun 2020 23:33:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732859AbgFTDaZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 19 Jun 2020 23:30:25 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 801ABC0613EF
        for <linux-clk@vger.kernel.org>; Fri, 19 Jun 2020 20:30:20 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id y17so4805385plb.8
        for <linux-clk@vger.kernel.org>; Fri, 19 Jun 2020 20:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Fi8ab2CkfvIdd/5P+r0S5dxyJT2k4tSVWykkUvi99fU=;
        b=j8nQ3B7FpehCsunpSEVQSYjhSIMs22zucCRygwZBlcD7nkUj3GKDredCjm7jP++dYB
         i7TY+cL1cZ8JWvzIZIwoGoSA4hKFNbTalPofMuwWJS+BqEcADvjf61J9SbvMWxiL2Qla
         oIQyEGAM0IVcrPLyW1oKnN6H6KktioV1Ny5ps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Fi8ab2CkfvIdd/5P+r0S5dxyJT2k4tSVWykkUvi99fU=;
        b=YfHOT/fYzU+fbDZyl4AaS3Ry6rPH41sdL0THxXku52lU4SVGrtN+bG7CcTFGQrsxNV
         eiGXknbOytDl2SQJQkF+L/VihqvY7xcRcGbm9MdVZQThODoN0Au0JzQ75+6pS4dJR8cT
         IEPag1roUurdVetctMdCXhR5WRtEqIrC1j3lRuoyFzphcw3mbEtUTXyrpbVm4DpL4Z8J
         nkX9uLJOHl/mZ8i/TpkvBF7NZfbJ5aBw6XBwbJx3haY+sOGe/iqQFtRofwDqMOFlQiBj
         Kvb/+IWYixV0G7CcMX+leiTOearki0Y5Bh/0BYb6vtRXuAdFaUaipTCwv081AcJ+G4ek
         DmEA==
X-Gm-Message-State: AOAM530fq3+MkAQF54H+9RjjUHPLlcNpT2HN99LyU6e+oGgHpr+hn/wf
        PJwGO5XUM6RoogrEDTvXhmj1eA==
X-Google-Smtp-Source: ABdhPJzKykKp69oTsLEAQ228A8aBga9uw6xzilqOJlYhvnET2ogoJrzcYkicI+7HggPAmmAR7pqRqg==
X-Received: by 2002:a17:90b:3614:: with SMTP id ml20mr6333214pjb.41.1592623820052;
        Fri, 19 Jun 2020 20:30:20 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id p19sm7198155pff.116.2020.06.19.20.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2020 20:30:17 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     Kees Cook <keescook@chromium.org>,
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
Subject: [PATCH v2 01/16] docs: deprecated.rst: Add uninitialized_var()
Date:   Fri, 19 Jun 2020 20:29:52 -0700
Message-Id: <20200620033007.1444705-2-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200620033007.1444705-1-keescook@chromium.org>
References: <20200620033007.1444705-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Nothing should be using this macro, and the entire idea of tricking the
compiler into silencing such warnings is a mistake.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 Documentation/process/deprecated.rst | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/process/deprecated.rst b/Documentation/process/deprecated.rst
index 652e2aa02a66..943a926ecbbb 100644
--- a/Documentation/process/deprecated.rst
+++ b/Documentation/process/deprecated.rst
@@ -51,6 +51,24 @@ to make sure their systems do not continue running in the face of
 "unreachable" conditions. (For example, see commits like `this one
 <https://git.kernel.org/linus/d4689846881d160a4d12a514e991a740bcb5d65a>`_.)
 
+uninitialized_var()
+-------------------
+For any compiler warnings about uninitialized variables, just add
+an initializer. Using the uninitialized_var() macro (or similar
+warning-silencing tricks) is dangerous as it papers over `real bugs
+<https://lore.kernel.org/lkml/20200603174714.192027-1-glider@google.com/>`_
+(or can in the future), and suppresses unrelated compiler warnings
+(e.g. "unused variable"). If the compiler thinks it is uninitialized,
+either simply initialize the variable or make compiler changes. Keep in
+mind that in most cases, if an initialization is obviously redundant,
+the compiler's dead-store elimination pass will make sure there are no
+needless variable writes.
+
+As Linus has said, this macro
+`must <https://lore.kernel.org/lkml/CA+55aFw+Vbj0i=1TGqCR5vQkCzWJ0QxK6CernOU6eedsudAixw@mail.gmail.com/>`_
+`be <https://lore.kernel.org/lkml/CA+55aFwgbgqhbp1fkxvRKEpzyR5J8n1vKT1VZdz9knmPuXhOeg@mail.gmail.com/>`_
+`removed <https://lore.kernel.org/lkml/CA+55aFz2500WfbKXAx8s67wrm9=yVJu65TpLgN_ybYNv0VEOKA@mail.gmail.com/>`_.
+
 open-coded arithmetic in allocator arguments
 --------------------------------------------
 Dynamic size calculations (especially multiplication) should not be
-- 
2.25.1


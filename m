Return-Path: <linux-clk+bounces-20491-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9A9A85AD6
	for <lists+linux-clk@lfdr.de>; Fri, 11 Apr 2025 13:02:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB381446104
	for <lists+linux-clk@lfdr.de>; Fri, 11 Apr 2025 11:00:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB9BB29AAF8;
	Fri, 11 Apr 2025 10:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W8uqf2zd"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0900A29AAFC
	for <linux-clk@vger.kernel.org>; Fri, 11 Apr 2025 10:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744369159; cv=none; b=DTd+QfjNj0UUHIYm24SF96nD+QbfcNZWspkg7kWU1qFvq1wEqICoURgwCWW9XB/4ld0lcr17pUyYShQMCM6aTTVNQNcP+aLDxF792MTsD3+pcYXpGdy1OOqUNNzUrYevqj91Sjm5KFPM6Ml5BhJBOPL60SGF7UWKQpZpm7UBszE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744369159; c=relaxed/simple;
	bh=4HWksdgns8ejVb++Q4NJVdKDSuHEDHdMmvi+j+YhGlo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jinbEm+Tkj5ZVGxG0/qE6EoUlMPntOEFI/y7Ehk4LJZo4cxrupfc2YBvMHWV0C8pkscWTU2vK+h5kNR8yHF4ebE/xlmZl+yKVDWaJvkLpY3FE8qSmUnr3A4tZF2qBwKnzIxrLV4UXM1Fxv5qyg6sgx6zrPrmkENHVemYR693LU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W8uqf2zd; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-227d6b530d8so18126015ad.3
        for <linux-clk@vger.kernel.org>; Fri, 11 Apr 2025 03:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744369157; x=1744973957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WNsggH78Gujq22EIg5QA+ygoUlPHiqAj8S6vH5ayXvk=;
        b=W8uqf2zdbXcIa4+ACQdrVhXrWCZXk6jyA/onIbfexogHthWLxyjlxMepujBcUlbG/W
         JP3mwJ1tq4x5z6/e/8VrDfOrXmlC1kts9K6gQIOLSugNY66CY0+q1VCnRWCF44cNV8Ie
         VQtxKNjZEgeKHaKDBHX6CO46gaSj76QaBJKUHOscGLccmtie9lomapIkMlKRFOK39R3N
         /HWKt+p8T2MFjZeaNglNubJJHCsEJM3gf8JFtmYjkP0DmMaIHfCPrlxX3ySnN3pEawFq
         P3vTND70cEvJiZrPr2yNTr81LUqG9akHSc2Ni2zhOJUPxdpBNRPXvViRfucx1pabYQsm
         x1ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744369157; x=1744973957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WNsggH78Gujq22EIg5QA+ygoUlPHiqAj8S6vH5ayXvk=;
        b=Qc0APJvP0dTReAHHDQ7Sza4TZFiAsK6qymsOiUriSbtjqpMtGarxmNedvKEkLhjZrl
         LMTwS0dlAyzWp0oz7S3LrkCwcXl1nDZ6KX8NMqe8CGRVkje17fBGRbSHyif5ihZaHPzT
         CME96KNKx5UC5JjFdq+iddYK9aGvzp+pG77n2yTu/Mpwfl0Z9CgnowikCzeByheENDVw
         AB3hJWGxZsuk7IA3o56qnivjJa4Vu+AHMAR9xU6pKUtb4RA0Kq44ErmJdJRHIoS1rqjm
         mF+HrPiU25wrmIBFNXGHqqfPH9CpI50kVwDUhtJ3vasze/mnJCthF2tfSHPNlKsUQMiQ
         BVYA==
X-Forwarded-Encrypted: i=1; AJvYcCVqmboONNsMurC2wfDNVVpNTCucHM7X9e4+s19WOTttpZc1gUQncyHrdsmzJ3N9WFv19N6ssP3d3fQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7MYcfApRXPxSK/FHtyTMrtIvJ7NJHAiJbvPpn0yWwDN4FVJUX
	MzhCVDDcAjdZzWmFQUfhIj9MHgipG7Kt1LIEE87efe6hZ5GGvN+zVMSFarRZJwM=
X-Gm-Gg: ASbGncsdpI2dqS2OYfJrpuTm9nOqHEMQOej+Hbo3CZlxjzG+PnlGtiWcYl0B7QU2T64
	SF9uSbmnF8MPgEQ8U4XCjYYqPh+S2petn2fhn43GFcUNT2lBEtH9n0znF2eTsMNJtYTAkM8l4iP
	3BFqGcbTGLoTFViycJ/FCzaLSw9nMRCbxwpnYrki5W0woEDnLG3SmdIWGWAodCPETkN4n5cQNTN
	f835whvjrpJnzzcM3+9WgpWvHjfqTA6Db/pkdz6/kPWPx4kMPmzeI+nDR7v2XaXMVa8xGCaT4ep
	SaXuNWhVvlQH6Ln7DaoRqh8G4rTKErV/gFiXw06MGjLaBPJvi1Oi
X-Google-Smtp-Source: AGHT+IH9e7cgh40RGHrp6DdyOeOKOuNr9Mg3YeYV53VmI8E16z+vogz/YR9lNX06NEc1ZrK9TH2sfQ==
X-Received: by 2002:a17:902:f78c:b0:223:2630:6b82 with SMTP id d9443c01a7336-22bea494e3amr41594895ad.10.1744369157462;
        Fri, 11 Apr 2025 03:59:17 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ce07e1sm45797485ad.258.2025.04.11.03.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 03:59:16 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Danilo Krummrich <dakr@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Nishanth Menon <nm@ti.com>,
	rust-for-linux@vger.kernel.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Erik Schilling <erik.schilling@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Yury Norov <yury.norov@gmail.com>,
	Burak Emir <bqe@google.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Russell King <linux@armlinux.org.uk>,
	linux-clk@vger.kernel.org,
	Daniel Almeida <daniel.almeida@collabora.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH V9 05/17] rust: clk: Add helpers for Rust code
Date: Fri, 11 Apr 2025 16:25:04 +0530
Message-Id: <cf62158e595b78858e21789b350b186908a95f32.1744366571.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1744366571.git.viresh.kumar@linaro.org>
References: <cover.1744366571.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Non-trivial C macros and inlined C functions cannot be used directly
in the Rust code and are used via functions ("helpers") that wrap
those so that they can be called from Rust.

In order to prepare for adding Rust abstractions for the clock APIs,
add clock helpers required by the Rust implementation.

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 MAINTAINERS                     |  1 +
 rust/bindings/bindings_helper.h |  1 +
 rust/helpers/clk.c              | 66 +++++++++++++++++++++++++++++++++
 rust/helpers/helpers.c          |  1 +
 4 files changed, 69 insertions(+)
 create mode 100644 rust/helpers/clk.c

diff --git a/MAINTAINERS b/MAINTAINERS
index bd7c54af4fd4..608689342aaf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5883,6 +5883,7 @@ F:	include/dt-bindings/clock/
 F:	include/linux/clk-pr*
 F:	include/linux/clk/
 F:	include/linux/of_clk.h
+F:	rust/helpers/clk.c
 X:	drivers/clk/clkdev.c
 
 COMMON INTERNET FILE SYSTEM CLIENT (CIFS and SMB3)
diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index ab37e1d35c70..f53d6e1a21f2 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -10,6 +10,7 @@
 #include <linux/blk-mq.h>
 #include <linux/blk_types.h>
 #include <linux/blkdev.h>
+#include <linux/clk.h>
 #include <linux/cpumask.h>
 #include <linux/cred.h>
 #include <linux/device/faux.h>
diff --git a/rust/helpers/clk.c b/rust/helpers/clk.c
new file mode 100644
index 000000000000..6d04372c9f3b
--- /dev/null
+++ b/rust/helpers/clk.c
@@ -0,0 +1,66 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/clk.h>
+
+/*
+ * The "inline" implementation of below helpers are only available when
+ * CONFIG_HAVE_CLK or CONFIG_HAVE_CLK_PREPARE aren't set.
+ */
+#ifndef CONFIG_HAVE_CLK
+struct clk *rust_helper_clk_get(struct device *dev, const char *id)
+{
+	return clk_get(dev, id);
+}
+
+void rust_helper_clk_put(struct clk *clk)
+{
+	clk_put(clk);
+}
+
+int rust_helper_clk_enable(struct clk *clk)
+{
+	return clk_enable(clk);
+}
+
+void rust_helper_clk_disable(struct clk *clk)
+{
+	clk_disable(clk);
+}
+
+unsigned long rust_helper_clk_get_rate(struct clk *clk)
+{
+	return clk_get_rate(clk);
+}
+
+int rust_helper_clk_set_rate(struct clk *clk, unsigned long rate)
+{
+	return clk_set_rate(clk, rate);
+}
+#endif
+
+#ifndef CONFIG_HAVE_CLK_PREPARE
+int rust_helper_clk_prepare(struct clk *clk)
+{
+	return clk_prepare(clk);
+}
+
+void rust_helper_clk_unprepare(struct clk *clk)
+{
+	clk_unprepare(clk);
+}
+#endif
+
+struct clk *rust_helper_clk_get_optional(struct device *dev, const char *id)
+{
+	return clk_get_optional(dev, id);
+}
+
+int rust_helper_clk_prepare_enable(struct clk *clk)
+{
+	return clk_prepare_enable(clk);
+}
+
+void rust_helper_clk_disable_unprepare(struct clk *clk)
+{
+	clk_disable_unprepare(clk);
+}
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index e1c21eba9b15..ae595c9cd91b 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -11,6 +11,7 @@
 #include "bug.c"
 #include "build_assert.c"
 #include "build_bug.c"
+#include "clk.c"
 #include "cpumask.c"
 #include "cred.c"
 #include "device.c"
-- 
2.31.1.272.g89b43f80a514



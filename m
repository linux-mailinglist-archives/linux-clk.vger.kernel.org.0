Return-Path: <linux-clk+bounces-20495-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EEAA85AE4
	for <lists+linux-clk@lfdr.de>; Fri, 11 Apr 2025 13:03:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E88774634F6
	for <lists+linux-clk@lfdr.de>; Fri, 11 Apr 2025 11:01:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D0D729CB39;
	Fri, 11 Apr 2025 10:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NviPOeo7"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1BB29C35E
	for <linux-clk@vger.kernel.org>; Fri, 11 Apr 2025 10:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744369174; cv=none; b=eqNIYynhueUiFuDswtMyiuOKFy/Nh1wMgBxH6OZF6vkgZKNwPQiHkkTSFXcMiLpuhUAxtNRsyIxC6GhB6DQNHiuntTW02YJ+vphv5XwWdDD7BbCJHJqlOZqrnJXgxTRUhjHpMgu4VP2EDTkD8ncVS0fA5XZHB506p8LY82B1GoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744369174; c=relaxed/simple;
	bh=Byyja/LGiSc3XLWcrkh1dI+1vAbHiMVZxbMK+5UoA5o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FMyyTLxnwAUgbf54VJkU7LYfPzzQcgvVvPlCdnFdEInraX/mhl+8fWkYuIxvhj+xHbksAY0JE6/6tY7cur3dDAvhyHYKf1jpr+TBbb0oT1mtMEyiPMY42GypiDt6Syn9y6rxSg7nkwTBQ6oK13QxM6SrDF/JuV/Cdb81Gcms9Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NviPOeo7; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22435603572so17703475ad.1
        for <linux-clk@vger.kernel.org>; Fri, 11 Apr 2025 03:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744369172; x=1744973972; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X+Cdlcrsb0s4b6sV0qOOxY8kfU8SJ6MQU1RsCnBdvL8=;
        b=NviPOeo7m3bFs5pclrqrdwRClbuZnskMh3kDwmyCLhpG6vx0y5kNuvQy0ptCfR2kIV
         isIsXyzsUD43cHj4bHOb0gH30PK6Ms1K4KJb5XB0jG4UnYQZI/axscoqEnCgBjoz5v7Q
         zm/bLEWYGa9uEXQ/Z73wkCSwvs+LWyPeQpabb/BEkVSEGVWr4tMxRw3WlsGzpNfAN6QB
         PjvYo+FAxeNP4OkWTARWwwtpfwbKdNa3X1lbHLQBViLaCSG3iI070sGCoJvh/0Xu3T5I
         X1+yH4xM48ZXzADajDpkjisY5Zv/3OVGl34+mIKIdORm8HZBw3kFG1gGeM4Fxae4xUMQ
         oSuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744369172; x=1744973972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X+Cdlcrsb0s4b6sV0qOOxY8kfU8SJ6MQU1RsCnBdvL8=;
        b=onshaNE/tW3pwEBNEMPvcXQgteQaIkQTQoSLWVBuN9CdaKNFXykcQtlOeDW/N36KPf
         0ovbDc2qHOerqGNeIaSkdok0joOI8WqqbxX+G/WDDOA905qf6BAC63kGCS9FfgCyvEdr
         zfRa3geNZl1Fq6y5IF2mzE7VQX/AysN4hu45g9yJ4js/XmSQL/G7E+QO8g8SKMk9PWgf
         bmvl/IHi34MaZG8+twzdp4EB8HEOOIZqI0G9l8khH/1r74FSNOj2uje0RUr2GuiEYSLt
         yHIQ1E2OI5N76P+AWR7m+0djJ00TchGZEArOw4/KNMnVMkio4qO9teOgF97TTVoJOB4g
         5YxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxDD81qKGKhe+9rZERFYWUKjqdy7/n8lbcve1JoXmO3R8A2uHdDj/pzHP7UgwRabOvini21fgwk70=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx1Wi/afj0IumfUVjbNYLLx65/kT7pYwy6hevM2eksDNJluybC
	lBLC306YFCPuxUpU/XUQ9owPe+TYTuKuytIHhQBeJjSIOnqgziLrPr7jy1ddinw=
X-Gm-Gg: ASbGncv4EfSKL6F5duj4XdgJ7EgnfrxeQzO2D6SqSAdrZlBnlgmA/uya+QbSJRxiAqC
	XiRmdEuO99AF/3Za/QTuKKhPMMXb/JN4BH3mC4shDLbCmXvxecoqcPUQBtt/3CuCcIWhTBX8KZV
	A4hrkkDHcPsFGc8fn4sGfWS3SUaJUFoqtT7cqeWwLAbBMbtjsKsrCzORvHmmKOHy25TyotgxUzq
	saFkZEEzy/lxCuq3jlUcf/WLRhiV2eUXndrWEgIEVqRVgVecWLTuPIvYcxvNEv63GB3+ve6Q2+D
	VtJ9HC7sVqIzkO277sQzi8kCApTQR0zWbCc/PkbTXA==
X-Google-Smtp-Source: AGHT+IFzxhsDTNlU/qz7rOhat5Sn8AXMBCAAIpk2YH/+AobNOEjEcLNAinjLGlCu2Vf5XXJJin63Pw==
X-Received: by 2002:a17:902:e751:b0:224:2715:bf44 with SMTP id d9443c01a7336-22bea4ab7a0mr31283275ad.19.1744369172173;
        Fri, 11 Apr 2025 03:59:32 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c95c8esm45981535ad.145.2025.04.11.03.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 03:59:31 -0700 (PDT)
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
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>,
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
	Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH V9 09/17] rust: cpu: Add from_cpu()
Date: Fri, 11 Apr 2025 16:25:08 +0530
Message-Id: <475bc73d8d11290446a4135af76aea123c6d80ee.1744366571.git.viresh.kumar@linaro.org>
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

This implements cpu::from_cpu(), which returns a reference to
Device for a CPU. The C struct is created at initialization time for
CPUs and is never freed and so ARef isn't returned from this function.

The new helper will be used by Rust based cpufreq drivers.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 MAINTAINERS                     |  1 +
 rust/bindings/bindings_helper.h |  1 +
 rust/kernel/cpu.rs              | 31 +++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |  1 +
 4 files changed, 34 insertions(+)
 create mode 100644 rust/kernel/cpu.rs

diff --git a/MAINTAINERS b/MAINTAINERS
index 12cde55579a0..475abf72869c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6155,6 +6155,7 @@ F:	include/linux/cpuhotplug.h
 F:	include/linux/smpboot.h
 F:	kernel/cpu.c
 F:	kernel/smpboot.*
+F:	rust/kernel/cpu.rs
 
 CPU IDLE TIME MANAGEMENT FRAMEWORK
 M:	"Rafael J. Wysocki" <rafael@kernel.org>
diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index f53d6e1a21f2..ac92c67d2c38 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -11,6 +11,7 @@
 #include <linux/blk_types.h>
 #include <linux/blkdev.h>
 #include <linux/clk.h>
+#include <linux/cpu.h>
 #include <linux/cpumask.h>
 #include <linux/cred.h>
 #include <linux/device/faux.h>
diff --git a/rust/kernel/cpu.rs b/rust/kernel/cpu.rs
new file mode 100644
index 000000000000..3054165d3818
--- /dev/null
+++ b/rust/kernel/cpu.rs
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Generic CPU definitions.
+//!
+//! C header: [`include/linux/cpu.h`](srctree/include/linux/cpu.h)
+
+use crate::{bindings, device::Device, error::Result, prelude::ENODEV};
+
+/// Creates a new instance of CPU's device.
+///
+/// # Safety
+///
+/// Reference counting is not implemented for the CPU device in the C code. When a CPU is
+/// hot-unplugged, the corresponding CPU device is unregistered, but its associated memory
+/// is not freed.
+///
+/// Callers must ensure that the CPU device is not used after it has been unregistered.
+/// This can be achieved, for example, by registering a CPU hotplug notifier and removing
+/// any references to the CPU device within the notifier's callback.
+pub unsafe fn from_cpu(cpu: u32) -> Result<&'static Device> {
+    // SAFETY: The pointer returned by `get_cpu_device()`, if not `NULL`, is a valid pointer to
+    // a `struct device` and is never freed by the C code.
+    let ptr = unsafe { bindings::get_cpu_device(cpu) };
+    if ptr.is_null() {
+        return Err(ENODEV);
+    }
+
+    // SAFETY: The pointer returned by `get_cpu_device()`, if not `NULL`, is a valid pointer to
+    // a `struct device` and is never freed by the C code.
+    Ok(unsafe { Device::as_ref(ptr) })
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index f4dcfefe94be..db372f806875 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -44,6 +44,7 @@
 pub mod build_assert;
 #[cfg(CONFIG_COMMON_CLK)]
 pub mod clk;
+pub mod cpu;
 pub mod cpumask;
 pub mod cred;
 pub mod device;
-- 
2.31.1.272.g89b43f80a514



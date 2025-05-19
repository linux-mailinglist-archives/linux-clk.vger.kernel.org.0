Return-Path: <linux-clk+bounces-22014-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 280CEABB5BB
	for <lists+linux-clk@lfdr.de>; Mon, 19 May 2025 09:12:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 857BB7A61EB
	for <lists+linux-clk@lfdr.de>; Mon, 19 May 2025 07:09:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27F3E269CE0;
	Mon, 19 May 2025 07:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wPZjBqtt"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721D7269AFD
	for <linux-clk@vger.kernel.org>; Mon, 19 May 2025 07:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747638493; cv=none; b=aZDTCzRMgBNAhdvEqGAjMLYjR2qOJ9MeZSljJWMqgLUyesWwJBDt43h/26EJHcjPHX4LxUj+iXcha5DrfMsKfWgiuaSDW/Wbgnf/6m2+G9slut8cS9qlajvbn8BD/cj977mW0TqznWg0ZTlQW5QNF+N5+7Udc502TPIAmwhIegQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747638493; c=relaxed/simple;
	bh=juOq7g4rijYkdxYFdOONMCnI1QPlZoKOeRbFNRc5CdA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lfQKLGiWl68clIgHDhoLeW6hxoLk+sErWwUI2m/+7o79YXr05X0kXuadjO4ly7bYPoAs2Jey/qa1h3VwxpZbW6G/HJoRr2CzYOI6S8ad873QoMJU2RECHUc8LBP0CpAtVxONqVb2rnslX/PKyXWZZ17XZbLTf6LMc9PAakm6Wpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wPZjBqtt; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-30e8f4dbb72so2786499a91.1
        for <linux-clk@vger.kernel.org>; Mon, 19 May 2025 00:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747638490; x=1748243290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4r3X/jvGTdLizcE+YYmP7gaggu0BT8JGhgAP9zX20zQ=;
        b=wPZjBqttr+hHHhBIqnTEXaCYP6p1mVG29YFLK8j2tQ50zoHy4GnQUg5PtnJNT1PaKV
         zdDvuE8FhAIO6DomX7fSaiLE+EgRdnx1tz+t5mnaaTG4046YN8/c5lFQvtvA4Mborz3Q
         QY84k+DhIFRu3mtaM7wm8OeAp6SbdKZnvwkrHs6aofpvWkrrNIMbp7agIW+ePo4imshD
         33nw7pjAGEWD+IXsM46daodfEJvDyvXg4apXuL+qsBbC+50RBNXfdleODe+Ah77FBFCO
         SL4Oayuis4AZWnG6AhoA9swQ4GGp8zUeqhis2sVhYmcoaSOidJy4uEM64VUYIHIxEg7R
         F/MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747638490; x=1748243290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4r3X/jvGTdLizcE+YYmP7gaggu0BT8JGhgAP9zX20zQ=;
        b=ZoOnz7k5lRS5+w4Ta4pFIS4dJSOtIei0IhbdqY0bF8Zd2fMYGcS/mwO/T3gwC+CAqm
         +QBvqQgye2vXnR9K8IRXg60yE8N8HxNyXOGipFIQLvBobUCSAKyVbSMBggSr+PIF9Bir
         pFqeSyFIGWaWHnEH3GQfwAsvWS8tCjnT5U+1dQbc2xM37ZxOZyX332d4PfHKFYhiXkEd
         O+f3V4GHUIDdMou/P1EKQo7pRKNBL4JMBGSYFyB0zOyWD8zo4Ic+ToJZl8MTWqaMe8y4
         z9k7yMeZOJPqF/wJGx1kvdsGODsf7y/iwNybvsaGeW42nscRfUq+H7s03sQFtVMfXzuu
         9mgg==
X-Forwarded-Encrypted: i=1; AJvYcCUaJ2oSOWoUHZwxSgwz3OsC193kDA4T8/rfeYFje8SV6TAxXCDDIyZIyVutUcn+O+Mrcie9cpIutLQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxakRm9j+JFHZBwzeyTD2S/w9kh94vfGLwDxB0Pt26IEhV/qZ4g
	py9yD33GW8X7Vgpf+1sJX/FFRxm4KDFj+D9rP9WIpB+YWRndNPialBNxZo2oEPH86FA=
X-Gm-Gg: ASbGncvr9pe48sHkCzdR9NZmicQm3oO+ckb0Heg2WKfRnNBSbqVsU4W8J1he48X5EPs
	aLkLfr/3PQCuWaN/yLCuuiwRxw15ebbflNXZAcPc3wK9OLvizYkjq251JxkIdHg9l0ZT2+5fHmM
	vxlaJ929DC70n+nkMTKcIZXhUNP4hsnLOkN4ih5p+x2VOTUhzo221DLFgM3yy1yBm6uE3zq370g
	Ov0b9W4+lgIPIt7DAoRS2DvrMMThyKTmAZq6788MVmc+meYvbdzbE4EKEFbYxgKofUYRdSGUaaw
	+ycihrUnMwzdkTOIpr21eBbWkqepvPi1AhCnnEFQ5sIzQXFj/hceD0ib/wFYtpw=
X-Google-Smtp-Source: AGHT+IEwnItI1adJ5eNRnfUIiONeAwIaER/7UxHP7sLjQh/2fUqJp7LQ0oLpGHM32/z5QPdXw+IjVA==
X-Received: by 2002:a17:90b:3b8f:b0:2ff:6608:78cd with SMTP id 98e67ed59e1d1-30e830fbe31mr19285978a91.9.1747638490516;
        Mon, 19 May 2025 00:08:10 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e7d4aa777sm5971781a91.21.2025.05.19.00.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 00:08:09 -0700 (PDT)
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
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Yury Norov <yury.norov@gmail.com>,
	Burak Emir <bqe@google.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Russell King <linux@armlinux.org.uk>,
	linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Andrew Ballance <andrewjballance@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH V12 07/15] rust: cpu: Add from_cpu()
Date: Mon, 19 May 2025 12:37:12 +0530
Message-Id: <19bc845f59e0a7a6bbc5c23353d04f96f23aaed9.1747634382.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1747634382.git.viresh.kumar@linaro.org>
References: <cover.1747634382.git.viresh.kumar@linaro.org>
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
 rust/kernel/cpu.rs              | 30 ++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |  1 +
 4 files changed, 33 insertions(+)
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
index 000000000000..10c5c3b25873
--- /dev/null
+++ b/rust/kernel/cpu.rs
@@ -0,0 +1,30 @@
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
+    // SAFETY: It is safe to call `get_cpu_device()` for any CPU.
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
index 3fd7c17cbc06..de0a840fcc99 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -43,6 +43,7 @@
 #[doc(hidden)]
 pub mod build_assert;
 pub mod clk;
+pub mod cpu;
 pub mod cpumask;
 pub mod cred;
 pub mod device;
-- 
2.31.1.272.g89b43f80a514



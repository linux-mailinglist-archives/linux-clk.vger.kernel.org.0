Return-Path: <linux-clk+bounces-20723-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1862CA91672
	for <lists+linux-clk@lfdr.de>; Thu, 17 Apr 2025 10:29:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 273F6445474
	for <lists+linux-clk@lfdr.de>; Thu, 17 Apr 2025 08:29:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AC1722F17B;
	Thu, 17 Apr 2025 08:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MZg9B/wQ"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401D522E015
	for <linux-clk@vger.kernel.org>; Thu, 17 Apr 2025 08:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744878553; cv=none; b=TcERKnSC9CSJAXKQzVcl6rfBOJyne27XEKrB59ZKQPNOAImY2jFOjtwjigE9JNsbZ9P+zJV5MQO5ElfzopFp8ZoXsnnd3xJ/4ER3BoZtG2nq5nIdZhiY8CyeEqoc0ZnoYd4ZP6Ncq7o/yJdhzmH/Jsnt+P/WBCnkAa4rP2OXxBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744878553; c=relaxed/simple;
	bh=3/vgDjCrgZa5uCteWUGcFJnQGVlfoXz1AwY0O+AtYOM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qbgrZHg370R9gg4lktvzaOoN+moR1dPy3omZFyehANwyg2VkL+cOxJLsuiZ86MrKfSY2Qn3Fa2BdoP1ddzzMDz9xDZi/6My7qR6YDWwq53S1pY70rzVEumyVi0SzWVTDD7YR8STKuP/jF6xqccoW5TcVnn09HwM0RzMhFESio9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MZg9B/wQ; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b061a775ac3so419042a12.0
        for <linux-clk@vger.kernel.org>; Thu, 17 Apr 2025 01:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744878549; x=1745483349; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PyD6KO8YvruoUk4/0kPab719fAzdttfmbmaEhsrAlRk=;
        b=MZg9B/wQBsQy+Mg1kUAxon1I5eyTj70f8Bp2bF7HKCKzz48vzXPUxoF1ueqEpnOMZs
         a6viEaC4wNVkwwAJgN+MdtUHqqoTxjiYDoV3FbFq3WrsDYC9bvQPKFysuZqgNZWo3wFJ
         U1kKPc1iK7khMab4kfb4u6pRCZ39kzXNzemMwJjh6qE7JIKxJ6XkL9U8DAT4zNmooUKI
         18xhJHdhI0h/pBE0TcxGtJ00mDfmDJTmqrGw72K38wr/9xJyCrMV6Z907I1xbcQyIQ1u
         lNtFeSRkHyjPxDgb3L8hj1Aom7hUWUatROL72S+rEhGWgjbdFFvIa3R0Pe2OthCGNBF0
         TxfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744878549; x=1745483349;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PyD6KO8YvruoUk4/0kPab719fAzdttfmbmaEhsrAlRk=;
        b=QnUk4QmNljBYU2AP5+U8VHkOwxCQpFk9FisysWg3xKubrgo0L1TVKqUuqBNX951OCG
         PgE9pzOSnGrPdlssHYYN05lLx2Ra6kqjJyR+Ev8CH/+jyuomx4FO9tLltYURhQ9CZCZl
         hpJdeOdGg7FJopewFSQTkfSrAAPjz1dM1s6ArQ4dA/K12MMB2nf2+gQQJ1KYV3/sQrVH
         LEOuLp/SILRN0si06linY01fhtdT+iO2WnBwuh/1gMJ9TWIf3vIKZVmy/ZAtL92C93TU
         wBXQb/tSzKn2WP4LU350cOIW+O98HPcWUg+MQrYR5Zceutz2W+n6x8n+3oZfLjl+vOez
         22OQ==
X-Forwarded-Encrypted: i=1; AJvYcCV79ve12boU5PojBbNIThZTDYF45Z54LI4yu4wABuyj6LKOubS23GtETJXRqS24FEmHOjFgPv2gCcw=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywbvld3p5nLnY3kc0wRwvREXktE4PyVYmyOW/EIGe2hyN2wft7r
	G4Dr1E/6MmDZ5w4rXRWSuGG+zPyPTlFhNEqWFAP55MtvjkZ5BgvUd0WsyFWFiNg=
X-Gm-Gg: ASbGncv9WhM8VYhUbqmayM5iqrSS9k0zl1fx4AS2dMTo9IOYxvr7oPM1QraDsCFeNP9
	sht3dH8/R0/T3Bk+CIzXycibR6ln1x/UbSpdRPd417gCI1Iqc2s8/T9oYQcWqBJc2Adba4LSnkn
	/aFHbpFWRbmZMb60+xQf316GkL50gOmCNjS4jHGS5LOXLS6UW0LrZXFirwIx6c9UIbjBuyqf2CC
	emXtp+ylQJIMqc8FrlTT6UEdaJBh6YYY/jL+S+Vt85M03B/bLOPOP9Ayt2aSOefvI99lMM1rroS
	HgYeVbh6+Un7sMegB5h8kM/wEfrOUN95kp2l2l74Xw==
X-Google-Smtp-Source: AGHT+IGKZy23x3q26QZRyO3ngPemCrclOCyCL/i7EsViysQutnVjfqb0sd+8kgeGk19d0WdcgJjWkA==
X-Received: by 2002:a17:90b:5408:b0:2f5:88bb:12f with SMTP id 98e67ed59e1d1-30863f303c8mr6856606a91.21.1744878549064;
        Thu, 17 Apr 2025 01:29:09 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30861212533sm3079579a91.22.2025.04.17.01.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 01:29:08 -0700 (PDT)
Date: Thu, 17 Apr 2025 13:59:06 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Danilo Krummrich <dakr@redhat.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>, Nishanth Menon <nm@ti.com>,
	rust-for-linux@vger.kernel.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>, Rob Herring <robh@kernel.org>,
	Yury Norov <yury.norov@gmail.com>, Burak Emir <bqe@google.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V10 13/15] rust: cpufreq: Extend abstractions for driver
 registration
Message-ID: <20250417082906.dfiproihig7egkp2@vireshk-i7>
References: <cover.1744783509.git.viresh.kumar@linaro.org>
 <8d04ef19d7a16610dbf0dfb5c9a611c6e1e3e318.1744783509.git.viresh.kumar@linaro.org>
 <Z_9ysHFmvZvaoe8H@pollux>
 <20250416101726.g5jm6wnbbsmuskxl@vireshk-i7>
 <Z_-Nh_dDifS1lvOD@pollux>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_-Nh_dDifS1lvOD@pollux>

On 16-04-25, 12:59, Danilo Krummrich wrote:
> Anyways, that doesn't help for now. Unfortunately, I think you actually need to
> dynamically allocate it. There's no need to revert everything though. You can
> just allocate a new KBox from VTABLE, i.e.
> 
> 	let vtable = KBox::new(Self::VTABLE, GFP_KERNEL)?;

Thanks. Here is the diff for this patch:

diff --git a/rust/kernel/cpufreq.rs b/rust/kernel/cpufreq.rs
index e8f4e18002c9..8cb62641c64b 100644
--- a/rust/kernel/cpufreq.rs
+++ b/rust/kernel/cpufreq.rs
@@ -9,7 +9,6 @@
 //! Reference: <https://docs.kernel.org/admin-guide/pm/cpufreq.html>
 
 use crate::{
-    alloc::AllocError,
     clk::{Clk, Hertz},
     cpumask,
     device::Device,
@@ -22,16 +21,17 @@
 };
 
 use core::{
+    cell::UnsafeCell,
     marker::PhantomData,
     mem::MaybeUninit,
     ops::{Deref, DerefMut},
     pin::Pin,
-    ptr::{self, NonNull},
+    ptr,
 };
 
 use macros::vtable;
 
-// Maximum length of CPU frequency driver's name.
+/// Maximum length of CPU frequency driver's name.
 const CPUFREQ_NAME_LEN: usize = bindings::CPUFREQ_NAME_LEN as usize;
 
 /// Default transition latency value in nanoseconds.
@@ -872,7 +872,7 @@ fn register_em(_policy: &mut Policy) {
 ///         data.generic_verify()
 ///     }
 ///
-///     fn target_index(policy: &mut cpufreq::Policy, index: u32) -> Result<()> {
+///     fn target_index(policy: &mut cpufreq::Policy, index: cpufreq::TableIndex) -> Result<()> {
 ///         // Update CPU frequency
 ///         Ok(())
 ///     }
@@ -887,15 +887,15 @@ fn register_em(_policy: &mut Policy) {
 /// }
 /// ```
 #[repr(transparent)]
-pub struct Registration<T: Driver>(NonNull<bindings::cpufreq_driver>, PhantomData<T>);
+pub struct Registration<T: Driver>(KBox<UnsafeCell<bindings::cpufreq_driver>>, PhantomData<T>);
 
-// SAFETY: `Registration` doesn't offer any methods or access to fields when shared between threads
-// or CPUs, so it is safe to share it.
+/// SAFETY: `Registration` doesn't offer any methods or access to fields when shared between threads
+/// or CPUs, so it is safe to share it.
 unsafe impl<T: Driver> Sync for Registration<T> {}
 
 #[allow(clippy::non_send_fields_in_send_ty)]
-// SAFETY: Registration with and unregistration from the cpufreq subsystem can happen from any
-// thread.
+/// SAFETY: Registration with and unregistration from the cpufreq subsystem can happen from any
+/// thread.
 unsafe impl<T: Driver> Send for Registration<T> {}
 
 impl<T: Driver> Registration<T> {
@@ -1020,16 +1020,14 @@ impl<T: Driver> Registration<T> {
 
     /// Registers a CPU frequency driver with the cpufreq core.
     pub fn new() -> Result<Self> {
-        let drv: *const bindings::cpufreq_driver = &Self::VTABLE;
-        let drv = drv.cast_mut();
+        // We can't use `&Self::VTABLE` directly because the cpufreq core modifies some fields in
+        // the C `struct cpufreq_driver`, which requires a mutable reference.
+        let mut drv = KBox::new(UnsafeCell::new(Self::VTABLE), GFP_KERNEL)?;
 
-        // SAFETY: It is safe to register the driver with the cpufreq core in the kernel C code.
-        to_result(unsafe { bindings::cpufreq_register_driver(drv) })?;
+        // SAFETY: `drv` is guaranteed to be valid for the lifetime of `Registration`.
+        to_result(unsafe { bindings::cpufreq_register_driver(drv.get_mut()) })?;
 
-        Ok(Self(
-            NonNull::new(drv.cast()).ok_or(AllocError)?,
-            PhantomData,
-        ))
+        Ok(Self(drv, PhantomData))
     }
 
     /// Same as [`Registration::new`], but does not return a [`Registration`] instance.
@@ -1037,16 +1035,15 @@ pub fn new() -> Result<Self> {
     /// Instead the [`Registration`] is owned by [`Devres`] and will be revoked / dropped, once the
     /// device is detached.
     pub fn new_foreign_owned(dev: &Device) -> Result<()> {
-        Devres::new_foreign_owned(dev, Self::new()?, GFP_KERNEL)?;
-        Ok(())
+        Devres::new_foreign_owned(dev, Self::new()?, GFP_KERNEL)
     }
 }
 
-// CPU frequency driver callbacks.
+/// CPU frequency driver callbacks.
 impl<T: Driver> Registration<T> {
-    // Driver's `init` callback.
-    //
-    // SAFETY: Called from C. Inputs must be valid pointers.
+    /// Driver's `init` callback.
+    ///
+    /// SAFETY: Called from C. Inputs must be valid pointers.
     extern "C" fn init_callback(ptr: *mut bindings::cpufreq_policy) -> kernel::ffi::c_int {
         from_result(|| {
             // SAFETY: The `ptr` is guaranteed to be valid by the contract with the C code for the
@@ -1059,9 +1056,9 @@ extern "C" fn init_callback(ptr: *mut bindings::cpufreq_policy) -> kernel::ffi::
         })
     }
 
-    // Driver's `exit` callback.
-    //
-    // SAFETY: Called from C. Inputs must be valid pointers.
+    /// Driver's `exit` callback.
+    ///
+    /// SAFETY: Called from C. Inputs must be valid pointers.
     extern "C" fn exit_callback(ptr: *mut bindings::cpufreq_policy) {
         // SAFETY: The `ptr` is guaranteed to be valid by the contract with the C code for the
         // lifetime of `policy`.
@@ -1071,9 +1068,9 @@ extern "C" fn exit_callback(ptr: *mut bindings::cpufreq_policy) {
         let _ = T::exit(policy, data);
     }
 
-    // Driver's `online` callback.
-    //
-    // SAFETY: Called from C. Inputs must be valid pointers.
+    /// Driver's `online` callback.
+    ///
+    /// SAFETY: Called from C. Inputs must be valid pointers.
     extern "C" fn online_callback(ptr: *mut bindings::cpufreq_policy) -> kernel::ffi::c_int {
         from_result(|| {
             // SAFETY: The `ptr` is guaranteed to be valid by the contract with the C code for the
@@ -1083,9 +1080,9 @@ extern "C" fn online_callback(ptr: *mut bindings::cpufreq_policy) -> kernel::ffi
         })
     }
 
-    // Driver's `offline` callback.
-    //
-    // SAFETY: Called from C. Inputs must be valid pointers.
+    /// Driver's `offline` callback.
+    ///
+    /// SAFETY: Called from C. Inputs must be valid pointers.
     extern "C" fn offline_callback(ptr: *mut bindings::cpufreq_policy) -> kernel::ffi::c_int {
         from_result(|| {
             // SAFETY: The `ptr` is guaranteed to be valid by the contract with the C code for the
@@ -1095,9 +1092,9 @@ extern "C" fn offline_callback(ptr: *mut bindings::cpufreq_policy) -> kernel::ff
         })
     }
 
-    // Driver's `suspend` callback.
-    //
-    // SAFETY: Called from C. Inputs must be valid pointers.
+    /// Driver's `suspend` callback.
+    ///
+    /// SAFETY: Called from C. Inputs must be valid pointers.
     extern "C" fn suspend_callback(ptr: *mut bindings::cpufreq_policy) -> kernel::ffi::c_int {
         from_result(|| {
             // SAFETY: The `ptr` is guaranteed to be valid by the contract with the C code for the
@@ -1107,9 +1104,9 @@ extern "C" fn suspend_callback(ptr: *mut bindings::cpufreq_policy) -> kernel::ff
         })
     }
 
-    // Driver's `resume` callback.
-    //
-    // SAFETY: Called from C. Inputs must be valid pointers.
+    /// Driver's `resume` callback.
+    ///
+    /// SAFETY: Called from C. Inputs must be valid pointers.
     extern "C" fn resume_callback(ptr: *mut bindings::cpufreq_policy) -> kernel::ffi::c_int {
         from_result(|| {
             // SAFETY: The `ptr` is guaranteed to be valid by the contract with the C code for the
@@ -1119,9 +1116,9 @@ extern "C" fn resume_callback(ptr: *mut bindings::cpufreq_policy) -> kernel::ffi
         })
     }
 
-    // Driver's `ready` callback.
-    //
-    // SAFETY: Called from C. Inputs must be valid pointers.
+    /// Driver's `ready` callback.
+    ///
+    /// SAFETY: Called from C. Inputs must be valid pointers.
     extern "C" fn ready_callback(ptr: *mut bindings::cpufreq_policy) {
         // SAFETY: The `ptr` is guaranteed to be valid by the contract with the C code for the
         // lifetime of `policy`.
@@ -1129,9 +1126,9 @@ extern "C" fn ready_callback(ptr: *mut bindings::cpufreq_policy) {
         T::ready(policy);
     }
 
-    // Driver's `verify` callback.
-    //
-    // SAFETY: Called from C. Inputs must be valid pointers.
+    /// Driver's `verify` callback.
+    ///
+    /// SAFETY: Called from C. Inputs must be valid pointers.
     extern "C" fn verify_callback(ptr: *mut bindings::cpufreq_policy_data) -> kernel::ffi::c_int {
         from_result(|| {
             // SAFETY: The `ptr` is guaranteed to be valid by the contract with the C code for the
@@ -1141,9 +1138,9 @@ extern "C" fn verify_callback(ptr: *mut bindings::cpufreq_policy_data) -> kernel
         })
     }
 
-    // Driver's `setpolicy` callback.
-    //
-    // SAFETY: Called from C. Inputs must be valid pointers.
+    /// Driver's `setpolicy` callback.
+    ///
+    /// SAFETY: Called from C. Inputs must be valid pointers.
     extern "C" fn setpolicy_callback(ptr: *mut bindings::cpufreq_policy) -> kernel::ffi::c_int {
         from_result(|| {
             // SAFETY: The `ptr` is guaranteed to be valid by the contract with the C code for the
@@ -1153,9 +1150,9 @@ extern "C" fn setpolicy_callback(ptr: *mut bindings::cpufreq_policy) -> kernel::
         })
     }
 
-    // Driver's `target` callback.
-    //
-    // SAFETY: Called from C. Inputs must be valid pointers.
+    /// Driver's `target` callback.
+    ///
+    /// SAFETY: Called from C. Inputs must be valid pointers.
     extern "C" fn target_callback(
         ptr: *mut bindings::cpufreq_policy,
         target_freq: u32,
@@ -1169,9 +1166,9 @@ extern "C" fn target_callback(
         })
     }
 
-    // Driver's `target_index` callback.
-    //
-    // SAFETY: Called from C. Inputs must be valid pointers.
+    /// Driver's `target_index` callback.
+    ///
+    /// SAFETY: Called from C. Inputs must be valid pointers.
     extern "C" fn target_index_callback(
         ptr: *mut bindings::cpufreq_policy,
         index: u32,
@@ -1180,13 +1177,18 @@ extern "C" fn target_index_callback(
             // SAFETY: The `ptr` is guaranteed to be valid by the contract with the C code for the
             // lifetime of `policy`.
             let policy = unsafe { Policy::from_raw_mut(ptr) };
+
+            // SAFETY: The C code guarantees that `index` corresponds to a valid entry in the
+            // frequency table.
+            let index = unsafe { TableIndex::new(index as usize) };
+
             T::target_index(policy, index).map(|()| 0)
         })
     }
 
-    // Driver's `fast_switch` callback.
-    //
-    // SAFETY: Called from C. Inputs must be valid pointers.
+    /// Driver's `fast_switch` callback.
+    ///
+    /// SAFETY: Called from C. Inputs must be valid pointers.
     extern "C" fn fast_switch_callback(
         ptr: *mut bindings::cpufreq_policy,
         target_freq: u32,
@@ -1197,7 +1199,7 @@ extern "C" fn fast_switch_callback(
         T::fast_switch(policy, target_freq)
     }
 
-    // Driver's `adjust_perf` callback.
+    /// Driver's `adjust_perf` callback.
     extern "C" fn adjust_perf_callback(
         cpu: u32,
         min_perf: usize,
@@ -1209,9 +1211,9 @@ extern "C" fn adjust_perf_callback(
         }
     }
 
-    // Driver's `get_intermediate` callback.
-    //
-    // SAFETY: Called from C. Inputs must be valid pointers.
+    /// Driver's `get_intermediate` callback.
+    ///
+    /// SAFETY: Called from C. Inputs must be valid pointers.
     extern "C" fn get_intermediate_callback(
         ptr: *mut bindings::cpufreq_policy,
         index: u32,
@@ -1219,12 +1221,17 @@ extern "C" fn get_intermediate_callback(
         // SAFETY: The `ptr` is guaranteed to be valid by the contract with the C code for the
         // lifetime of `policy`.
         let policy = unsafe { Policy::from_raw_mut(ptr) };
+
+        // SAFETY: The C code guarantees that `index` corresponds to a valid entry in the
+        // frequency table.
+        let index = unsafe { TableIndex::new(index as usize) };
+
         T::get_intermediate(policy, index)
     }
 
-    // Driver's `target_intermediate` callback.
-    //
-    // SAFETY: Called from C. Inputs must be valid pointers.
+    /// Driver's `target_intermediate` callback.
+    ///
+    /// SAFETY: Called from C. Inputs must be valid pointers.
     extern "C" fn target_intermediate_callback(
         ptr: *mut bindings::cpufreq_policy,
         index: u32,
@@ -1233,25 +1240,30 @@ extern "C" fn target_intermediate_callback(
             // SAFETY: The `ptr` is guaranteed to be valid by the contract with the C code for the
             // lifetime of `policy`.
             let policy = unsafe { Policy::from_raw_mut(ptr) };
+
+            // SAFETY: The C code guarantees that `index` corresponds to a valid entry in the
+            // frequency table.
+            let index = unsafe { TableIndex::new(index as usize) };
+
             T::target_intermediate(policy, index).map(|()| 0)
         })
     }
 
-    // Driver's `get` callback.
+    /// Driver's `get` callback.
     extern "C" fn get_callback(cpu: u32) -> kernel::ffi::c_uint {
         PolicyCpu::from_cpu(cpu).map_or(0, |mut policy| T::get(&mut policy).map_or(0, |f| f))
     }
 
-    // Driver's `update_limit` callback.
+    /// Driver's `update_limit` callback.
     extern "C" fn update_limits_callback(cpu: u32) {
         if let Ok(mut policy) = PolicyCpu::from_cpu(cpu) {
             T::update_limits(&mut policy);
         }
     }
 
-    // Driver's `bios_limit` callback.
-    //
-    // SAFETY: Called from C. Inputs must be valid pointers.
+    /// Driver's `bios_limit` callback.
+    ///
+    /// SAFETY: Called from C. Inputs must be valid pointers.
     extern "C" fn bios_limit_callback(cpu: i32, limit: *mut u32) -> kernel::ffi::c_int {
         from_result(|| {
             let mut policy = PolicyCpu::from_cpu(cpu as u32)?;
@@ -1261,9 +1273,9 @@ extern "C" fn bios_limit_callback(cpu: i32, limit: *mut u32) -> kernel::ffi::c_i
         })
     }
 
-    // Driver's `set_boost` callback.
-    //
-    // SAFETY: Called from C. Inputs must be valid pointers.
+    /// Driver's `set_boost` callback.
+    ///
+    /// SAFETY: Called from C. Inputs must be valid pointers.
     extern "C" fn set_boost_callback(
         ptr: *mut bindings::cpufreq_policy,
         state: i32,
@@ -1276,9 +1288,9 @@ extern "C" fn set_boost_callback(
         })
     }
 
-    // Driver's `register_em` callback.
-    //
-    // SAFETY: Called from C. Inputs must be valid pointers.
+    /// Driver's `register_em` callback.
+    ///
+    /// SAFETY: Called from C. Inputs must be valid pointers.
     extern "C" fn register_em_callback(ptr: *mut bindings::cpufreq_policy) {
         // SAFETY: The `ptr` is guaranteed to be valid by the contract with the C code for the
         // lifetime of `policy`.
@@ -1288,9 +1300,9 @@ extern "C" fn register_em_callback(ptr: *mut bindings::cpufreq_policy) {
 }
 
 impl<T: Driver> Drop for Registration<T> {
-    // Removes the `Registration` from the kernel, if it has initialized successfully earlier.
+    /// Unregisters with the cpufreq core.
     fn drop(&mut self) {
-        // SAFETY: The driver was earlier registered from `new`.
-        unsafe { bindings::cpufreq_unregister_driver(self.0.as_ptr()) };
+        // SAFETY: `self.0` is guaranteed to be valid for the lifetime of `Registration`.
+        unsafe { bindings::cpufreq_unregister_driver(self.0.get_mut()) };
     }
 }

-- 
viresh

